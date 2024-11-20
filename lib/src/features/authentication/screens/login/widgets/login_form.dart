import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/navigation_menu.dart';
import 'package:smartscape/src/features/authentication/screens/login/controller/login_controller.dart';
import 'package:smartscape/src/features/authentication/screens/password_authorization/forget_password.dart';
import 'package:smartscape/src/features/authentication/screens/signup/sign_up_page.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/validator/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: Ttext.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: Ttext.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          ///Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Remember Me
              Row(
                children: [
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  Obx(
                    () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value),
                  ),
                  const Text(Ttext.rememberMe),
                ],
              ),

              ///Forget PASSWORD
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(Ttext.forgetPassword)),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          ///sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(Ttext.signIn)),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          ///Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpPage()),
                child: const Text(Ttext.createAccount)),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    ));
  }
}
