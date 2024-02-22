import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalenderController extends GetxController {
  var calenderTimes = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch calendar times for the current month and year when the controller initializes
    fetchCalenderTimes();
  }

  void fetchCalenderTimes() async {
    final response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/calendar/${DateTime.now().year}/${DateTime.now().month}?latitude=23.78062070&longitude=90.34928600&method=2'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'];
      calenderTimes.value = List<Map<String, dynamic>>.from(data);
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }
}
