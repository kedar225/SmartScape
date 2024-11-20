import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/loaders/loaders.dart';
import 'package:smartscape/src/data/repositories/authentication_repository.dart';
import 'package:smartscape/src/data/repositories/user/user_repository.dart';
import 'package:smartscape/src/features/authentication/screens/signup/signup_controller/network_manager.dart';
import 'package:smartscape/src/features/authentication/screens/signup/verify_email.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/helper/fullscreen_loader.dart';
import 'package:smartscape/src/utils/helper/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final PrivacyPolicy = true.obs;
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input

  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation.

  /// SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImage.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      // Start Loading

      // Check Internet Connectivity

      // Form Validation

      // Privacy Policy Check
      if (!PrivacyPolicy.value) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Provacy Policy & Terms and Conditions');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: "Your account has been created! Verify email to continue.");

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
