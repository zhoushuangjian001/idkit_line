import 'dart:math' show sin;
import 'package:flutter/material.dart';
import 'package:idkit_line/idkit_line.dart';
import 'package:idkit_line/src/line_config.dart' show LineAlign;

mixin LinePainterMixin {
  /// 虚线
  void drawDotted({
    required Canvas canvas,
    required Size size,
    required Paint paint,
    required double thickness,
    Axis? axis,
    LineAlign? align,
    double? indent,
    double? endIndent,
    DottedType? type,
    double? dashLength,
    double? interval,
  }) {
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    final double halfThickness = thickness * 0.5;
    final bool isAxis = axis == Axis.horizontal;
    for (var i = 0; i < size.width; i++) {
      canvas.drawLine(Offset(i * 10, 5), Offset(i * 10 + 6, 5), paint);
    }
    canvas.restore();
  }

  /// 实线
  void drawSolid({
    required Canvas canvas,
    required Size size,
    required Paint paint,
    required double thickness,
    Axis? axis,
    LineAlign? align,
    double? indent,
    double? endIndent,
  }) {
    Offset p1 = Offset.zero;
    Offset p2 = Offset.zero;

    /// 常量计算
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    final double halfThickness = thickness * 0.5;

    /// 水平
    final bool isAxis = axis == Axis.horizontal;
    final double totle = isAxis ? size.width : size.height;
    final double _totle = isAxis ? size.height : size.width;
    final double lineLength = totle - totleIndent;
    double offset = 0.0;
    switch (align) {
      case LineAlign.top:
      case LineAlign.left:
        offset = halfThickness;
        break;
      case LineAlign.bottom:
      case LineAlign.right:
        offset = _totle - halfThickness;
        break;
      default:
        final double half = (_totle - thickness) / 2;
        offset = half + halfThickness;
    }

    // 设置绘制点
    p1 = p1.translate(isAxis ? _indent : offset, isAxis ? offset : _indent);
    p2 = p2.translate(isAxis ? lineLength : offset, isAxis ? offset : lineLength);
    canvas.drawLine(p1, p2, paint);
    canvas.restore();
  }

  /// 波浪线
  void drawWavy({
    required Canvas canvas,
    required Size size,
    required Paint paint,
    required double thickness,
    Axis? axis,
    LineAlign? align,
    double? indent,
    double? endIndent,
    double? a,
    double? k,
    double? w,
  }) {
    // 常量定义
    final double halfThickness = thickness * 0.5;
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    final bool isAxis = axis == Axis.horizontal;
    final double totle = isAxis ? size.width : size.height;
    final double _totle = isAxis ? size.height : size.width;
    final double wavyLength = totle - totleIndent;
    double lastOffset = 0.0;
    final double _a = a ?? 1;
    final double _w = w ?? 1;
    final double _k = k ?? 0;
    switch (align) {
      case LineAlign.top:
      case LineAlign.left:
        lastOffset = _a + halfThickness;
        break;
      case LineAlign.bottom:
      case LineAlign.right:
        lastOffset = _totle - (_a + halfThickness);
        break;
      default:
        lastOffset = _totle * 0.5;
    }
    final Path path = Path();
    path.moveTo(isAxis ? _indent : lastOffset, isAxis ? lastOffset : _indent);
    for (double x = _indent; x < wavyLength; x += 0.5) {
      final double offsetY = _a * sin(_w * x) + _k;
      final double y = offsetY + lastOffset;
      path.lineTo(isAxis ? x : y, isAxis ? y : x);
    }
    canvas.drawPath(path, paint);
    canvas.restore();
  }
}
