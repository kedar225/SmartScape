import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smartscape/src/common/widgets/images/trounded_images.dart';
import 'package:smartscape/src/common/widgets/custom_shapes_container/circular_custom_shape.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/controller/home_contoller.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';

class TAdSlider extends StatelessWidget {
  const TAdSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            // You can add more options here as needed
          ),
          items: const [
            TroundedImages(imageUrl: TImage.ad_banner1),
            TroundedImages(imageUrl: TImage.ad_banner2),
            TroundedImages(imageUrl: TImage.ad_banner3),
          ],
        ), // CarouselSlider
        const SizedBox(
            height:
                TSizes.spaceBtwItems), // Space between the carousel and the row

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the items
            children: [
              for (int i = 0; i < 3; i++)
                TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? Color.fromARGB(255, 217, 0, 255)
                        : TColors.grey),
            ],
          ),
        ), // Row
      ],
    );
  }
}
