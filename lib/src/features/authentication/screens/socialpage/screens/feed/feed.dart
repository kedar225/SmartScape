import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/tabbar/tabbar_controller/tabbar_state_controller.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/feed/widget/feed_tabbar.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class MyFeed extends StatelessWidget {
  const MyFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return GetBuilder<FeedTabController>(
      init: FeedTabController(),
      builder: (_) => Scaffold(
        body: FeedTabBarWidget(
          tabTitles: const ["Local", "Official"],
          isDarkMode: isDarkMode,
          title: "My Feed",
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: TColors.primary,
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
