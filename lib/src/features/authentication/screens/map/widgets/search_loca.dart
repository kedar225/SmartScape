import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/map/widgets/map_button.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class SearchAndLocationWidget extends StatelessWidget {
  final bool dark;
  final VoidCallback onLocationTap;

  const SearchAndLocationWidget({
    super.key,
    required this.dark,
    required this.onLocationTap,
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search location',
                prefixIcon: Icon(
                  Icons.search,
                  color: dark ? Colors.grey[400] : Colors.grey[600],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: dark ? Colors.grey[800] : Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          MapButton(
            icon: Icons.my_location,
            onTap: onLocationTap,
          ),
        ],
      ),
    );
  }
}