import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/features/authentication/screens/login/login.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
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
                Ttext.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //SubTitle
              Text(
                Ttext.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Button
              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("Done")),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //Resend Email
              SizedBox(
                child: TextButton(
                    onPressed: () => Get.to(() => const ResetPassword()),
                    child: const Text(Ttext.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
