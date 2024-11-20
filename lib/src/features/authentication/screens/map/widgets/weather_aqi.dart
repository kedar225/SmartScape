import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/map_featurs_buttons.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/weather_aqi_info.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';


class WeatherAndAirQualityWidget extends StatelessWidget {
  final bool dark;
  final Future<Map<String, dynamic>> Function() getWeatherAndAirQuality;

  const WeatherAndAirQualityWidget({
    super.key,
    required this.dark,
    required this.getWeatherAndAirQuality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? Colors.grey[900]?.withOpacity(0.9) : Colors.white.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: FeatureButtonsWidget(dark: dark),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          FutureBuilder<Map<String, dynamic>>(
            future: getWeatherAndAirQuality(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WeatherAndAirQualityInfoWidget(
                  temperature: snapshot.data!['temperature'],
                  airQualityIndex: snapshot.data!['airQualityIndex'],
                  dark: dark,
                );
              } else if (snapshot.hasError) {
                return const Text('Error fetching data');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}