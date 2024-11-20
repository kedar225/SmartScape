import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartscape/src/common/widgets/images/circular_image.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class TUserProfile extends StatelessWidget {
  const TUserProfile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        width: 50,
        height: 50,
        padding: 0,
        image: TImage.user_logo,
      ),
      title: Text(
        Ttext.full_name,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        Ttext.useremail,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.light),
      ),
    );
  }
}
