import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  // Get current location permission
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled. Please enable them.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return true;
  }

  // Get city name from coordinates
  Future<String> getCurrentCity() async {
    try {
      // First check for permission
      await _handleLocationPermission();

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get place marks from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract city name
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // Use locality (city) or subAdministrativeArea (district) if city is not available
        return place.locality ??
            place.subAdministrativeArea ??
            'Unknown Location';
      }

      return 'Unknown Location';
    } catch (e) {
      throw Exception('Error getting location: $e');
    }
  }
}

