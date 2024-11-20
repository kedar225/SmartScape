import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class TCircularImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double padding;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final BoxFit fit;

  const TCircularImage({
    required this.image,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.light),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          color: overlayColor,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        ),
      ),
    );
  }
}

