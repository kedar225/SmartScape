import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/common/widgets/appbar/appbar.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class THomeScreenWidget extends StatelessWidget {
  const THomeScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning User",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Text(Ttext.full_name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white))
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.radar_1))
      ],
    );
  }
}
