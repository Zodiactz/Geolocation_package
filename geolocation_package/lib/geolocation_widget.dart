import 'package:flutter/material.dart';
import 'package:geolocation_package/geolocation_service.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationWidget extends StatefulWidget {
  @override
  _GeolocationWidgetState createState() => _GeolocationWidgetState();
}

class _GeolocationWidgetState extends State<GeolocationWidget> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    GeolocationService geolocationService = GeolocationService();
    try {
      Position? position = await geolocationService.getCurrentLocation();
      setState(() {
        _locationMessage = "Latitude: ${position?.latitude}, Longitude: ${position?.longitude}";
      });
    } catch (e) {
      setState(() {
        _locationMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geolocation Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_locationMessage),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}
