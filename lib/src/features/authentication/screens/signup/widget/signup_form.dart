import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/features/authentication/screens/signup/signup_controller/signup_controller.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/validator/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: Ttext.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: Ttext.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: Ttext.username,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: Ttext.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: Ttext.phoneNo,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
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
            const SizedBox(height: TSizes.spaceBtwInputFields),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(Ttext.createAccount)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
          ],
        ));
  }
}
