import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/controllers_onboarding/onboarding_controllers.dart';
import 'package:smartscape/src/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: 16.0,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('skip'),
        ));
  }
}
