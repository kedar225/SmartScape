import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/features/authentication/controllers_onboarding/onboarding_controllers.dart';
import 'package:smartscape/src/features/authentication/screens/onboardingscreens/widget/onboarding_next_button.dart';
import 'package:smartscape/src/features/authentication/screens/onboardingscreens/widget/onboarding_page.dart';
import 'package:smartscape/src/features/authentication/screens/onboardingscreens/widget/onboarding_skip.dart';
import 'package:smartscape/src/features/authentication/screens/onboardingscreens/widget/onboardingnavigation.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: TImage.OnBoardingImage1,
                  title: Ttext.onboardingTitle1,
                  subTitle: Ttext.onboardingSubtitle1),
              OnBoardingPage(
                  image: TImage.OnBoardingImage2,
                  title: Ttext.onboardingTitle2,
                  subTitle: Ttext.onboardingSubtitle2),
              OnBoardingPage(
                  image: TImage.OnBoardingImage3,
                  title: Ttext.onboardingTitle3,
                  subTitle: Ttext.onboardingSubtitle3),
            ],
          ),
          //Skip button
          const OnBoardingSkip(),

          //smooth page controller
          const OnBoardingNavigation(),

          //button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
