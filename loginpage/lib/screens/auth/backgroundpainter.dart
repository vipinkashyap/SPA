import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loginpage/config/palette.dart';
import 'package:flutter/animation.dart';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({Animation<double> animation})
      : bluePaint = Paint()
          ..color = Palette.Cyan
          ..style = PaintingStyle.fill,
        greenPaint = Paint()
          ..color = Palette.darkGreen
          ..style = PaintingStyle.fill,
        lightGreenPaint = Paint()
          ..color = Palette.lightGreen
          ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
          curve: Curves.elasticInOut,
          reverseCurve: Curves.bounceIn,
          parent: animation,
        ),
        greenAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        cyanAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.8,
            curve: Interval(0, 0.9, curve: SpringCurve()),
          ),
          reverseCurve: Curves.easeInCirc,
        ),
        lightGreenAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnim;
  final Animation<double> lightGreenAnim;
  final Animation<double> greenAnim;
  final Animation<double> cyanAnim;

  final Paint greenPaint;
  final Paint lightGreenPaint;
  final Paint bluePaint;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawPaint(Paint()..color = Palette.darkGreen);
    paintGreen(size, canvas);
    paintBlue(size, canvas);
    paintLightGreen(size, canvas);
  }

  void paintGreen(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, greenAnim.value),
    );
    _addPointsToPath(
      path,
      [
        Point(
          lerpDouble(0, size.width / 2, greenAnim.value),
          lerpDouble(0, size.height, greenAnim.value),
        ),
        Point(
          lerpDouble(size.width / 3, size.width / 4 * 3, liquidAnim.value),
          lerpDouble(size.height / 2, size.height / 4 * 2, liquidAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 2, size.height / 4 * 3, liquidAnim.value),
        ),
      ],
    );
    canvas.drawPath(path, greenPaint);
  }

  void paintBlue(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 400);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 2,
        size.height / 3,
        cyanAnim.value,
      ),
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(size.height / 2, size.height * 1 / 4, liquidAnim.value),
        ),
        Point(
          size.width * 2 / 4,
          lerpDouble(size.height / 5, size.height / 3, liquidAnim.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 3 * 2, cyanAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, cyanAnim.value),
        ),
      ],
    );

    canvas.drawPath(path, bluePaint);
  }

  void paintLightGreen(Size size, Canvas canvas) {
    if (lightGreenAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 6, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 4, lightGreenAnim.value),
      );

      _addPointsToPath(
        path,
        [
          Point(
            size.width / 5,
            lerpDouble(0, size.height / 4, lightGreenAnim.value),
          ),
          Point(
            size.width / 3,
            lerpDouble(0, size.height / 6, liquidAnim.value),
          ),
          Point(
            size.width / 3 * 2,
            lerpDouble(0, size.height / 8, liquidAnim.value),
          ),
          Point(
            size.width * 1 / 2,
            0,
          ),
        ],
      );

      canvas.drawPath(path, lightGreenPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('3 or more points required to create a path!');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.18,
    this.w = 18.0,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}
