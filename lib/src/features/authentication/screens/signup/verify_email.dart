import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/data/repositories/authentication_repository.dart';
import 'package:smartscape/src/features/authentication/screens/signup/signup_controller/verify_email_controller.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed:() => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                width: THelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(TImage.sammyManReceivesMail),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Title
              Text(
                Ttext.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              //SubTitle
              Text(
                Ttext.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Verify Email Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationState(),
                    child: const Text("Continue")),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //Resend Email
              SizedBox(
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(Ttext.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
