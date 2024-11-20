import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/features/authentication/screens/map/map_screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/event/event.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/feed/feed.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/home.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/settings/settings.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      //Docked floating Button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const MapScreen()),
        backgroundColor: dark ? TColors.black : TColors.white,
        elevation: 2,
        foregroundColor: TColors.white,
        // mini: true,
        shape: const CircleBorder(
          side:
              BorderSide(color: Color.fromARGB(255, 194, 116, 224), width: 1.0),
        ),
        child: const Icon(Iconsax.map),
      ),

      //Navigation Bar with state fun
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 65,
            elevation: 0,
            indicatorShape: const CircleBorder(eccentricity: 0.4),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.direct), label: "Feed"),
              NavigationDestination(
                  icon: Icon(Iconsax.location), label: "Event"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile")
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const MyFeed(),
    // Container(color: Colors.yellow),
    const MyEvent(),
    const SettingsScreen()
  ];
}
