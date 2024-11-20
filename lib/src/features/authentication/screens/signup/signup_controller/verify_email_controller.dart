import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/loaders/loaders.dart';
import 'package:smartscape/src/common/widgets/success_screen.dart';
import 'package:smartscape/src/data/repositories/authentication_repository.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Verification Sent',
          message: 'Check your E-Mail account for the verification email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImage.sammySuccess,
            title: Ttext.yourAccountCreatedTitle,
            subtitle: Ttext.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  checkEmailVerificationState() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImage.sammySuccess,
          title: Ttext.yourAccountCreatedTitle,
          subtitle: Ttext.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
