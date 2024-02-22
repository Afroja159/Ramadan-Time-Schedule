import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ramadantime/view/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DistrictLocationPage extends StatefulWidget {
  @override
  _DistrictLocationPageState createState() => _DistrictLocationPageState();
}

class _DistrictLocationPageState extends State<DistrictLocationPage> {
  String? _selectedDistrict;
  double _latitude = 0.0;
  double _longitude = 0.0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _getLocation() async {
    final SharedPreferences prefs = await _prefs;

    if (_selectedDistrict != null) {
      try {
        List<Location> locations = await locationFromAddress(
          '$_selectedDistrict, Bangladesh',
        );
        if (locations.isNotEmpty) {
          setState(() {
            _latitude = locations[0].latitude;
            prefs.setString('latitude', _latitude.toString());
            _longitude = locations[0].longitude;
            prefs.setString('longitude', _longitude.toString());
          });
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: Icon(Icons.person),
        title: Text('Ramadan Time Table'),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ),
            child: Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: _selectedDistrict,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDistrict = newValue;
                });
              },
              items: <String>[
                'Dhaka',
                'Comilla',
                'Barisal',
                // Add more districts as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _getLocation();
              },
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            Text('Latitude: $_latitude'),
            Text('Longitude: $_longitude'),
          ],
        ),
      ),
    );
  }
}
