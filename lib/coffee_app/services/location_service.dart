import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  Future<String> getCurrentLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocation = prefs.getString('selected_location');
    if (savedLocation != null) return savedLocation;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return 'Location disabled';

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever)
      return 'Permission denied forever';

    Position position = await Geolocator.getCurrentPosition();
    return await _getAddressFromCoordinates(position);
  }

  Future<String> _getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        return '${placemarks.first.locality}, ${placemarks.first.country}';
      }
    } catch (e) {
      return 'Location not found';
    }
    return 'Unknown';
  }
}
