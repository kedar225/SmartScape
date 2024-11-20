import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/common/widgets/appbar/appbar.dart';
import 'package:smartscape/src/common/widgets/images/circular_image.dart';
import 'package:smartscape/src/common/widgets/text/section_heading.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/settings/widgets/profile_menu_tile.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      width: 80,
                      height: 80,
                      image: TImage.user_logo,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //Profile Informaiton
              const TSectionHeading(
                title: "Profile Information",
                showaActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenuTile(
                onPressed: () {},
                title: 'Name',
                value: Ttext.full_name,
              ),
              TProfileMenuTile(
                onPressed: () {},
                title: 'Username',
                value: Ttext.user_name,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //PersonalInformation
              const TSectionHeading(
                title: "Personal Information",
                showaActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenuTile(
                onPressed: () {},
                title: 'UserID',
                value: '36347',
                icon: Iconsax.copy,
              ),
              TProfileMenuTile(
                onPressed: () {},
                title: 'E-Mail',
                value: Ttext.useremail,
              ),
              TProfileMenuTile(
                onPressed: () {},
                title: 'Phone Number',
                value: Ttext.phoneno,
              ),
              TProfileMenuTile(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenuTile(
                onPressed: () {},
                title: 'Date of Birth',
                value: Ttext.birthday,
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
