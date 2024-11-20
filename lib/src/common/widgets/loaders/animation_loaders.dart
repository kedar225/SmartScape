import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        // Makes the widget scrollable if it overflows
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 250), // Limit Lottie animation height
              child: Lottie.asset(
                animation,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Add padding for smaller screens
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            if (showAction)
              SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style:
                      OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                  child: Text(
                    actionText ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: TColors.light),
                    maxLines:
                        1, // Prevents multiline overflow in action button text
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
