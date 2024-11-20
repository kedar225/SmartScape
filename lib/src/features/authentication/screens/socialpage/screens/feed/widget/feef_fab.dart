import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/feed/tweet_screen/tweet_posting_screen.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class TTweetFAB extends StatelessWidget {
  const TTweetFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(
          () => const TTweetPostingScreen(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 300),
        );
      },
      backgroundColor: TColors.primary,
      elevation: 4,
      child: const Icon(Icons.edit),
    );
  }
}