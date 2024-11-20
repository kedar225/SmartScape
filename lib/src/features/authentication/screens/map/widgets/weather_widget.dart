import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class WeatherWidget extends StatelessWidget {
  final double? temperature;
  final bool dark;

  const WeatherWidget({
    super.key,
    required this.temperature,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: dark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.thermostat,
            color: TColors.primary,
          ),
          const SizedBox(height: 4),
          Text(
            temperature?.toStringAsFixed(0) ?? 'N/A',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: dark ? Colors.white : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}