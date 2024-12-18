import 'package:flutter/material.dart';
import 'package:smartscape/src/common/widgets/curve_edges_container/custom_curved_edges.dart';

class TCirularEdgeWidget extends StatelessWidget {
  const TCirularEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
