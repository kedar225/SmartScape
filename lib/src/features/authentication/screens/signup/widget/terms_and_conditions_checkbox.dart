import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class TSignUpCheckbox extends StatelessWidget {
  const TSignUpCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: true, onChanged: (Value) {})),
          const SizedBox(width: 0.7),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${Ttext.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: Ttext.privacyPolicy,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? TColors.white : TColors.primary,
                      ),
                ),
                TextSpan(
                    text: ' and ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: Ttext.termsOfUse,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? TColors.white : TColors.primary,
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