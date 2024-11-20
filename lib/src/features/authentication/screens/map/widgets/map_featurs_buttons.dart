import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/map_feturebutton.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class FeatureButtonsWidget extends StatelessWidget {
  final bool dark;

  const FeatureButtonsWidget({
    super.key,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nearby',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            MapFeatureButton(
              icon: Icons.bus_alert,
              label: 'Bus Stations',
              onTap: () {
                // Navigate to bus stations
              },
            ),
            MapFeatureButton(
              icon: Icons.train,
              label: 'Train Stations',
              onTap: () {
                // Navigate to train stations
              },
            ),
            MapFeatureButton(
              icon: Icons.local_hospital,
              label: 'Hospitals',
              onTap: () {
                // Navigate to hospitals
              },
            ),
            // Add more feature buttons
          ],
        ),
      ],
    );
  }
}