


import 'package:flutter/material.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          width: THelperFunctions.screenWidth() * 0.7,
          height: THelperFunctions.screenHeight() * 0.6,
          image: AssetImage(image),
        ),
        // const SizedBox(height: 14.0),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14.0),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}