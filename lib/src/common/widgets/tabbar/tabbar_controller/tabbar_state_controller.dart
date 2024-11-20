import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

// Model
class FeedTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isDarkMode = THelperFunctions.isDarkMode(Get.context!).obs;
  late TabController tabController;
  final currentTab = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
