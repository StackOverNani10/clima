import 'package:geolocator/geolocator.dart';

class Location {

  var latitude;
  var longitude;

  Future<void> getCurrentPosition() async {
    try
    {
      LocationPermission permision = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print('latitude: ${position.latitude}, longitude: ${position.longitude}');
    }
    catch(error) {
      print(error);
    }
  }
}