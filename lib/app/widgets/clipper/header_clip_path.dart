import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 50, size.height);
    //var endPoint = Offset(size.width, size.height - 50);

    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 5, size.height / 2);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint2.dy, controlPoint1.dx, controlPoint2.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint1.dy, controlPoint2.dx, controlPoint1.dy);

    path.lineTo(size.width, size.height - 50);
    path.close();

    // Path path = Path()
    //   ..moveTo(size.width / 2, 0)
    //   ..lineTo(0, size.height - 50)
    //   ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
    //       controlPoint2.dy, endPoint.dx, endPoint.dy)
    //   ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
