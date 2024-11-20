import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class MapFeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const MapFeatureButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: TColors.primary,
        padding: const EdgeInsets.all(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
