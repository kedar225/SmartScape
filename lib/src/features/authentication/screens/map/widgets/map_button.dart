import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class MapButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const MapButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
