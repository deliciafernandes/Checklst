import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';

class LocationService extends ChangeNotifier {
  String _userLocation = 'INDIA';
  double latitude;
  double longitude;

  Future<String> getLocation() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

      final coordinates = Coordinates(position.latitude, position.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      var first = addresses.first;

      var locality = first.locality;
      var subLocality = first.subLocality;

      _userLocation = subLocality + ', ' + locality + '.';
      _userLocation = _userLocation.toString();

      notifyListeners();
      return _userLocation;
    } catch (e) {
      print('$e       : occurred in LocationService.dart');

      notifyListeners();
      return _userLocation;
    }
  }

  Future<double> getLat() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return position.latitude;
    } catch (e) {
      print(e);
      return 20.5937;
    }
  }

  Future<double> getLong() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return position.longitude;
    } catch (e) {
      print(e);

      return 78.9629;
    }
  }
}
