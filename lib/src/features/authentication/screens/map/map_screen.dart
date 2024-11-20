import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:smartscape/src/features/authentication/screens/map/service/aqi_service.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/search_loca.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/weather_aqi.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:weather/weather.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late MapController mapController;
  final Location location = Location();
  LatLng currentLocation =
      LatLng(19.044468, 73.025595); // UNIVERSITY AS DEFAULT

  final WeatherFactory weatherFactory = WeatherFactory('ADD_YOUR_WHEATHER_API');
  final AirQualityRepository airQualityRepository =
      AirQualityRepository(apiKey: 'ADD_YOUR_AQI_API');

  Future<void> getUserLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      LocationData locationData = await location.getLocation();
      setState(() {
        currentLocation = LatLng(
          locationData.latitude!,
          locationData.longitude!,
        );
      });
      mapController.move(currentLocation, 14.0);
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  Future<Map<String, dynamic>> getWeatherAndAirQuality() async {
    try {
      Weather weather = await weatherFactory.currentWeatherByLocation(
        currentLocation.latitude,
        currentLocation.longitude,
      );

      int? airQualityIndex = await airQualityRepository.getAirQualityData(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
      );

      return {
        'temperature': weather.temperature?.celsius,
        'airQualityIndex': airQualityIndex,
      };
    } catch (e) {
      print("Error fetching weather or air quality data: $e");
      return {
        'temperature': null,
        'airQualityIndex': null,
      };
    }
  }

  @override
  void initState() {
    super.initState();
    mapController = MapController(); // Initialize map controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter:
              currentLocation, // Set map center to the current location
          initialZoom: 17.0, // Set zoom level
          minZoom: 3.0, // Minimum zoom level
          maxZoom: 18.0, // Maximum zoom level
        ),
        children: [
          TileLayer(
            // Display map tiles from any source
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.example.smartscape',
            // And many more recommended properties!
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: currentLocation,
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  color: TColors.primary,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SearchAndLocationWidget(
                dark: true, onLocationTap: getUserLocation),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WeatherAndAirQualityWidget(
              dark: true,
              getWeatherAndAirQuality: getWeatherAndAirQuality,
            ),
          ),
        ],
      ),
      // Add positioned widgets for search and weather info
    );
  }
}
