import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/features/authentication/screens/signup/signup_controller/signup_controller.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class TSignUpCheckbox extends StatelessWidget {
  const TSignUpCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.PrivacyPolicy.value,
                onChanged: (value) => controller.PrivacyPolicy.value =
                    !controller.PrivacyPolicy.value)),
          ),
          const SizedBox(width: 0.7),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${Ttext.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: Ttext.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                ),
                TextSpan(
                    text: ' and ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: Ttext
                      .termsOfUse, // privacy_policy = "https://www.freeprivacypolicy.com/live/1e4a3086-391c-407d-8f27-15aee38e0bf0"
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
