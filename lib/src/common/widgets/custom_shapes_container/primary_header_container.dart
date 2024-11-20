import 'package:flutter/material.dart';
import 'package:smartscape/src/common/widgets/curve_edges_container/curve_edges_widget.dart';
import 'package:smartscape/src/common/widgets/custom_shapes_container/circular_custom_shape.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCirularEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // height: 325,
          child: Stack(
            children: [
              const Positioned(
                  top: -150, right: -250, child: TCircularContainer()),
              const Positioned(
                  top: 100, right: -300, child: TCircularContainer()),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
