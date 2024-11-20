import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const LocationErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      margin: const EdgeInsets.all(TSizes.defaultSpace),
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_off,
            size: 48,
            color: TColors.primary,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            'Location Error',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: dark ? Colors.grey[400] : Colors.grey[600],
                ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.spaceBtwItems / 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
