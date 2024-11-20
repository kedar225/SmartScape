import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/loaders/animation_loaders.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';
import '../constants/colors.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  ///
  /// Parameters:
  /// - text: The text to be displayed in the loading dialog.
  /// - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (context) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.light,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), // Adjust the spacing as needed
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ), // Column
        ), // Container
      ), // WillPopScope
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
