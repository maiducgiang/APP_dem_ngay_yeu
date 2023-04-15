import 'dart:math';

import 'package:flutter/material.dart';

class HourProgressBar extends StatelessWidget {
  final double radius;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final DateTime dateTime;

  const HourProgressBar(
      {Key? key,
      required this.radius,
      required this.strokeWidth,
      required this.color,
      required this.backgroundColor,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: HourProgressBarPainter(
        strokeWidth: strokeWidth,
        color: color,
        backgroundColor: backgroundColor,
        dateTime: dateTime,
      ),
    );
  }
}

class HourProgressBarPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final DateTime dateTime;

  HourProgressBarPainter({
    required this.strokeWidth,
    required this.color,
    required this.backgroundColor,
    required this.dateTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = backgroundColor;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    canvas.drawCircle(center, radius, paint);

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
    final progressAngle = dateTime.hour / 24 * pi * 2;
    final progressPath = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        progressAngle,
      );
    canvas.drawPath(progressPath, progressPaint);

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    final dotOffset = Offset(
      center.dx + radius * cos(progressAngle - pi / 2),
      center.dy + radius * sin(progressAngle - pi / 2),
    );
    canvas.drawCircle(dotOffset, strokeWidth + 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}