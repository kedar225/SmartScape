import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/aqi_widget.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/weather_widget.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class WeatherAndAirQualityInfoWidget extends StatelessWidget {
  final double? temperature;
  final int? airQualityIndex;
  final bool dark;

  const WeatherAndAirQualityInfoWidget({
    super.key,
    required this.temperature,
    required this.airQualityIndex,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        WeatherWidget(
          temperature: temperature,
          dark: dark,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        AirQualityWidget(
          aqi: airQualityIndex,
          dark: dark,
        ),
      ],
    );
  }
}