import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/common/widgets/appbar/appbar.dart';
import 'package:smartscape/src/common/widgets/custom_shapes_container/primary_header_container.dart';
import 'package:smartscape/src/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:smartscape/src/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:smartscape/src/common/widgets/text/section_heading.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/settings/screens/profile.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.light),
                    ),
                  ),
                  TUserProfile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: "Account Settings"),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  //setting tile
                  TSettingsMenuTile(
                    icon: Iconsax.warning_2,
                    title: "Submitted Reports",
                    subTitle: "View all reports you've posted on the feed",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.note_add,
                    title: "Event Participation",
                    subTitle: "Browse events you've attended or joined",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location_add,
                    title: "Favorite Locations",
                    subTitle: "Quick access to your frequently visited places",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.dollar_square,
                    title: "Payment History",
                    subTitle: "Review payments and transactions",
                    onTap: () {},
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSectionHeading(
                    title: "App Settings",
                    showaActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: "Dark Mode",
                    subTitle: "Switch between light and dark themes",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Location Access",
                    subTitle:
                        "Allow app to use your location for better suggestions",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "High-Quality Images",
                    subTitle: "Enable HD images (may increase data usage)",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            // Add body content here
          ],
        ),
      ),
    );
  }
}
