import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lasttCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lasttCurve.dx, lasttCurve.dy);

    final secondfirstCurve = Offset(0, size.height - 20);
    final secondlasttCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondfirstCurve.dx, secondfirstCurve.dy,
        secondlasttCurve.dx, secondlasttCurve.dy);

    final thirdfirstCurve = Offset(size.width, size.height - 20);
    final thirdlasttCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstCurve.dx, thirdfirstCurve.dy,
        thirdlasttCurve.dx, thirdlasttCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
