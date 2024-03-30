import 'package:flutter/material.dart';

class RoundTopCorner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var leftCurve = Offset(0, size.height - 20);
    var rightCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        leftCurve.dx, leftCurve.dy, rightCurve.dx, rightCurve.dy);

    leftCurve = Offset(0, size.height - 20);
    rightCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        leftCurve.dx, leftCurve.dy, rightCurve.dx, rightCurve.dy);

    leftCurve = Offset(size.width, size.height - 20);
    rightCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
        leftCurve.dx, leftCurve.dy, rightCurve.dx, rightCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
