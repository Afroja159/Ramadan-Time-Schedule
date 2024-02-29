import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ramadantime/data/network/base_network_api.dart';
import 'package:ramadantime/data/network/network_api_services.dart';
import 'package:ramadantime/models/districtModel.dart';
import 'package:ramadantime/models/divisionModel.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/utils/time_format.dart';
import 'package:flutter/services.dart' as root;
import 'package:shared_preferences/shared_preferences.dart';

class PlaceController extends GetxController {
  var iftarTimeToday = ''.obs;
  var sehriTimeToday = ''.obs;
  var sehriTimeNextDay = ''.obs;
  var iftarTimeNextDay = ''.obs;
  var savedPlace = ''.obs;
  var  currentDate=''.obs;


  Map<String, dynamic> prayerTimes = {};

  final BaseApiService _apiService = NetworkApiService();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RxBool loading = false.obs;

  List<Divisions> divisionList = <Divisions>[].obs;
  List<Districts>? districtList = <Districts>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    savedPlaceGetting();
    super.onInit();
  }


// get divisions---------------------
  Future<List<Divisions>> getDivisions() async {
    loading.value = true;
    final jsonData = await root.rootBundle.loadString('assets/division.json');
    final list = await json.decode(jsonData) as List<dynamic>;
    divisionList =
        await list.map((division) => Divisions.fromJson(division)).toList();

    loading.value = false;
    return divisionList;
  }

// get Districts---------------------
  Future<void> getDistricts(Divisions division) async {
    loading.value = true;
    final jsonData = await root.rootBundle.loadString('assets/district.json');
    final List<Map<String, dynamic>> districtMaps =
        List<Map<String, dynamic>>.from(jsonDecode(jsonData));

    // Filter districts based on the division id
    final List<Map<String, dynamic>> filteredData = districtMaps
        .where((district) => district["division_id"] == division.id.toString())
        .toList();

    // Convert filtered data into Districts objects
    districtList =
        filteredData.map((district) => Districts.fromJson(district)).toList();
    loading.value = false;
  }

// save place on ------------
  Future<void> savePlace(
      String latitude, String longitude, String place) async {
    loading.value = true;
    final SharedPreferences prefs = await _prefs;
    // Remove data.
    await prefs.remove('latitude');
    await prefs.remove('longitude');
    await prefs.remove('place');

    // add data.
    await prefs.setString('latitude', latitude);
    await prefs.setString('longitude', longitude);
    await prefs.setString('place', place);

    await fetchTime();
    await savedPlaceGetting();
    loading.value = false;
  }

// getting saved Place------
  Future<void> savedPlaceGetting() async {
    final SharedPreferences prefs = await _prefs;
    savedPlace.value = prefs.getString('place') ?? ''; // Using null-aware operator
  }


// fetch namaz time from api---------------
  Future<dynamic> fetchTime() async {
    loading.value = true;
    final SharedPreferences prefs = await _prefs;
    String? latitude = prefs.getString('latitude');
    String? longitude = prefs.getString('longitude');
    await savedPlaceGetting();

    final String method = '4';

    String today =await todayDate();
    String nextday =await nextDay();

    dynamic responseToday = await _apiService.getApi(
        'http://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=$method');

    if (responseToday['code'] == 200) {
      final Map<String, dynamic> data = responseToday;
      final Map<String, dynamic> timeData = data['data']['timings'];
      final Map<String, dynamic> dateData = data['data']['date'];

      this.prayerTimes = timeData;
      this.currentDate.value=dateData['readable'];

      iftarTimeToday.value =
          TimeFormat(timeString: timeData['Maghrib']).timeConvert();
      sehriTimeToday.value =
          TimeFormat(timeString: timeData['Fajr']).timeConvert();

      // sehriTimeNextDay.value =
      //     TimeFormat(timeString: nextDayData['timings']['Fajr']).timeConvert();
    }
    loading.value = false;
    return responseToday;
  }

  String todayDate() {
    final DateTime now = DateTime.now();
    String formattedDateToday = '${now.year}-${now.month}-${now.day}';
    return formattedDateToday;
  }

  String nextDay() {
    final DateTime now = DateTime.now();
    final DateTime nextDay = now.add(Duration(days: 1));
    String formattedDateNextDay = '${now.year}-${now.month}-${nextDay}';
    return formattedDateNextDay;
  }

  // fetch namaz time for the next day from api---------------
  Future<dynamic> fetchNextDayTime() async {
    loading.value = true;
    final SharedPreferences prefs = await _prefs;
    String? latitude = prefs.getString('latitude');
    String? longitude = prefs.getString('longitude');

    // Get the date for the next day
    String nextDayDate = await nextDay();

    final String method = '2'; // Method for Islamic Society of North America (ISNA)

    dynamic responseNextDay = await _apiService.getApi(
        'http://api.aladhan.com/v1/timings/$nextDayDate?latitude=$latitude&longitude=$longitude&method=$method');

    if (responseNextDay['code'] == 200) {
      final Map<String, dynamic> data = responseNextDay;
      final Map<String, dynamic> timeData = data['data']['timings'];

      // Update the iftarTimeNextDay and sehriTimeNextDay variables with the fetched data
      iftarTimeNextDay.value = timeData['Maghrib'];
      sehriTimeNextDay.value = timeData['Fajr'];
    }

    loading.value = false;
    return responseNextDay;
  }

}
