import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
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
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  Checkbox(value: true, onChanged: (Value) {}),
                  const Text(Ttext.rememberMe),
                ],
              ),

              ///Forget PASSWORD
              TextButton(
                  onPressed: () {}, child: const Text(Ttext.forgetPassword)),
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
                onPressed: () {}, child: const Text(Ttext.createAccount)),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    ));
  }
}