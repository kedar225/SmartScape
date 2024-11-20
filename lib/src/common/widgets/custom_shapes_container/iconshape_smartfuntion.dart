import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class IconTitleWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const IconTitleWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    TColors.dark.withOpacity(0.2),
                    TColors.light.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  color: TColors.dark.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ),
        // const SizedBox(height: TSizes.spaceBtwItems / 3),
        Flexible(
          // Ensures text doesn't overflow
          child: Container(
            constraints: const BoxConstraints(maxWidth: 60),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
