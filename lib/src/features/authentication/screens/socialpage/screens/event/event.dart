// lib/src/pages/feed/my_feed.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/tabbar/tabbar_controller/tabbar_state_controller.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/widget/event_tabbar.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return GetBuilder<FeedTabController>(
      init: FeedTabController(),
      builder: (_) => Scaffold(
        body: EventTabBarWidget(
          tabTitles: const ["Events", "Joined"],
          isDarkMode: isDarkMode,
          title: "My Events",
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: TColors.primary,
        //   child: const Icon(Icons.edit),
        // ),
      ),
    );
  }
}
