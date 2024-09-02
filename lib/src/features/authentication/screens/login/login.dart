import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/common/styles/spacing_styles.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TspacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(height: 150, image: AssetImage(TImage.MainLogo)),
                  Text(
                    Ttext.WelcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSizes.sm),
                  Text(
                    Ttext.WelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              ///Form
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: Ttext.email,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    ///password
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: Ttext.password,
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields / 2),

                    ///Remember Me & Forget Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Remember Me
                        Row(
                          children: [
                            // ignore: avoid_types_as_parameter_names
                            Checkbox(value: true, onChanged: (Value) {}),
                            const Text(Ttext.rememberMe),
                          ],
                        ),

                        ///Forget PASSWORD
                        TextButton(
                            onPressed: () {},
                            child: const Text(Ttext.forgetPassword)),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    ///sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text(Ttext.signIn)),
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///Create Account Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(Ttext.createAccount)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              )),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
