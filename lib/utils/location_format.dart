import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationFormat {
  String city;
  LocationFormat({required this.city});

  getData() {
    Future<Map<String, dynamic>> fetchPrayerTimes() async {
      final String apiKey = 'YOUR_API_KEY';
      final String baseUrl = 'http://api.aladhan.com/v1/calendarByCity';

      final String city = this.city;
      final String country = 'Bangladesh';
      final String method = '4';

      // Get the current date
      final DateTime now = DateTime.now();
      final String month = now.month.toString();
      final String year = now.year.toString();

      // Build the API URL
      final String url =
          '$baseUrl?city=$city&country=$country&method=$method&month=$month&year=$year&annual=true';

      // Make the API request
      final response = await http.get(Uri.parse(url));

      // Check if the request was successful
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Extract Iftar and Sehri times for the current day
        final List<dynamic> items = data['data'];
        final Map<String, dynamic> todayData = items[now.day - 1];

        final String iftarTime = todayData['timings']['Maghrib'];
        final String sehriTime = todayData['timings']['Fajr'];

        return {
          'iftarTime': iftarTime,
          'sehriTime': sehriTime,
        };
      } else {
        throw Exception('Failed to load prayer times');
      }
    }
  }
}
