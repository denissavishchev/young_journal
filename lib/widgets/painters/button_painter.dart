import 'package:flutter/material.dart';



class ButtonPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var paintLight = Paint()
      ..color = Colors.blue.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    var pathLight = Path()
      ..moveTo(0, size.height * 0.5)
      ..cubicTo(size.width * 0.05, 0, size.width * 0.95, 0, size.width, size.height * 0.5)
      ..cubicTo(size.width, size.height, size.width * 0.85, size.height, size.width * 0.7, size.height * 0.95)
      ..cubicTo(size.width * 0.5, size.height * 0.9, size.width * 0.5, size.height * 0.9, size.width * 0.2, size.height * 0.95)
      ..cubicTo(0, size.height, 0, size.height * 0.8, 0, size.height * 0.5);

    canvas.drawPath(pathLight, paintLight);

    var paintShadow = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    var pathShadow = Path()
      ..moveTo(size.width * 0.07, size.height * 0.5)
      ..cubicTo(size.width * 0.12, size.height * 0.12, size.width, size.height * 0.12, size.width, size.height * 0.57)
      ..cubicTo(size.width, size.height, size.width * 0.85, size.height, size.width * 0.7, size.height * 0.95)
      ..cubicTo(size.width * 0.5, size.height * 0.9, size.width * 0.5, size.height * 0.9, size.width * 0.2, size.height * 0.95)
      ..cubicTo(size.width * 0.12, size.height, size.width * 0.12, size.height * 0.8, size.width * 0.12, size.height * 0.5);

    canvas.drawPath(pathShadow, paintShadow);

    var paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.5)
      ..cubicTo(size.width * 0.05, 0, size.width * 0.95, 0, size.width, size.height * 0.5)
      ..cubicTo(size.width, size.height, size.width * 0.85, size.height, size.width * 0.7, size.height * 0.95)
      ..cubicTo(size.width * 0.5, size.height * 0.9, size.width * 0.5, size.height * 0.9, size.width * 0.2, size.height * 0.95)
      ..cubicTo(0, size.height, 0, size.height * 0.8, 0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}