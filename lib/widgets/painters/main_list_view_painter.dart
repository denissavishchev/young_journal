import 'package:flutter/material.dart';

class MainListViewPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var paintLight = Paint()
      ..color = Colors.blue.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    var pathLight = Path()
      ..moveTo(0, size.height * 0.25)
      ..quadraticBezierTo(0, size.height * 0.08, size.width * 0.14, size.height * 0.1)
      ..cubicTo(size.width * 0.5, size.height * 0.18, size.width * 0.45, 0, size.width * 0.8, 0)
      ..quadraticBezierTo(size.width, 0, size.width, size.height *0.15)
      ..lineTo(size.width, size.height * 0.85)
      ..quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height)
      ..lineTo(size.width * 0.15, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height * 0.85)
      ..lineTo(0, size.height * 0.25);

    canvas.drawPath(pathLight, paintLight);

    var paintShadow = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    var pathShadow = Path()
    ..moveTo(size.height * 0.07, size.height * 0.25)
    ..quadraticBezierTo(size.height * 0.07, size.height * 0.15, size.width * 0.14, size.height * 0.17)
    ..cubicTo(size.width * 0.5, size.height * 0.25, size.width * 0.45, size.height * 0.07, size.width * 0.8, size.height * 0.07)
    ..quadraticBezierTo(size.width, 0, size.width, size.height *0.15)
    ..lineTo(size.width, size.height * 0.85)
    ..quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height)
    ..lineTo(size.width * 0.15, size.height)
    ..quadraticBezierTo(size.height * 0.07, size.height, size.height * 0.07, size.height * 0.85)
    ..lineTo(size.height * 0.07, size.height * 0.25);

    canvas.drawPath(pathShadow, paintShadow);

    var paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    var path = Path()
    ..moveTo(0, size.height * 0.25)
    ..quadraticBezierTo(0, size.height * 0.08, size.width * 0.14, size.height * 0.1)
    ..cubicTo(size.width * 0.5, size.height * 0.18, size.width * 0.45, 0, size.width * 0.8, 0)
    ..quadraticBezierTo(size.width, 0, size.width, size.height *0.15)
    ..lineTo(size.width, size.height * 0.85)
    ..quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height)
    ..lineTo(size.width * 0.15, size.height)
    ..quadraticBezierTo(0, size.height, 0, size.height * 0.85)
    ..lineTo(0, size.height * 0.25);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}