import 'package:get/get.dart';

class HomeContoller extends GetxController {
  static HomeContoller get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
}
