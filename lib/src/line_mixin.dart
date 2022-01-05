import 'dart:math' show sin;
import 'package:flutter/material.dart';
import 'package:idkit_line/idkit_line.dart';
import 'package:idkit_line/src/line_config.dart' show LineAlign;

mixin LinePainterMixin {
  /// Method of dashed line realization
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
    // Default settings for constants
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    final double halfThickness = thickness * 0.5;
    final bool isAxis = axis == Axis.horizontal;
    final double _dashLength = dashLength ?? 1;
    final double _interval = interval ?? 1;
    double _itemLength = 0.0;
    int multiple = 1;
    // Types of dashed lines
    switch (type) {
      case DottedType.dash_dot:
        // -- - -- -
        _itemLength = _dashLength + _interval * 2 + thickness;
        multiple = 2;
        break;
      default:
        // - - - -
        _itemLength = _dashLength + _interval;
    }

    // End error handling
    final double length = isAxis ? size.width : size.height;
    final double otherLength = isAxis ? size.height : size.width;

    final double lastLength = length - totleIndent - _dashLength;
    final int count = lastLength ~/ _itemLength;
    final double overLength = lastLength - count * _itemLength;
    final double _intervalDeviation = overLength / (multiple * count);
    _itemLength += multiple * _intervalDeviation;
    double _dx, _dy = 0;
    // Location distinction
    switch (align) {
      case LineAlign.top:
      case LineAlign.left:
        _dx = _indent;
        _dy = halfThickness;
        break;
      case LineAlign.bottom:
      case LineAlign.right:
        _dx = _indent;
        _dy = otherLength - halfThickness;
        break;
      default:
        _dx = _indent;
        _dy = otherLength * 0.5 - halfThickness;
    }
    // Start drawing
    Offset offset1, offset2;
    for (double i = 0; i < count; i++) {
      if (multiple == 2) {
        offset1 = Offset(_dx + i * _itemLength, _dy);
        offset2 = offset1.translate(_dashLength, 0);
        canvas.drawLine(isAxis ? offset1 : offset1.exchange(), isAxis ? offset2 : offset2.exchange(), paint);
        offset1 = offset2.translate(_interval, 0);
        offset2 = offset1.translate(thickness, 0);
        canvas.drawLine(isAxis ? offset1 : offset1.exchange(), isAxis ? offset2 : offset2.exchange(), paint);
      } else {
        offset1 = Offset(_dx + i * _itemLength, _dy);
        offset2 = offset1.translate(_dashLength, 0);
        canvas.drawLine(isAxis ? offset1 : offset1.exchange(), isAxis ? offset2 : offset2.exchange(), paint);
      }
    }
    final Offset offset3 = Offset(count * _itemLength + _dx, _dy);
    final Offset offset4 = offset3.translate(_dashLength, 0);
    canvas.drawLine(isAxis ? offset3 : offset3.exchange(), isAxis ? offset4 : offset4.exchange(), paint);
  }

  /// The method of solid line realization
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
    // Constant definition
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    final double halfThickness = thickness * 0.5;
    final bool isAxis = axis == Axis.horizontal;
    final double totle = isAxis ? size.width : size.height;
    final double _totle = isAxis ? size.height : size.width;
    final double lineLength = totle - totleIndent;
    // Location distinction
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

    // Start drawing
    p1 = p1.translate(isAxis ? _indent : offset, isAxis ? offset : _indent);
    p2 = p2.translate(isAxis ? lineLength : offset, isAxis ? offset : lineLength);
    canvas.drawLine(p1, p2, paint);
  }

  /// Ways to realize wavy lines
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
    final double halfThickness = thickness * 0.5;
    // Total indent
    final double _indent = indent ?? 0.0;
    final double _endIndent = endIndent ?? 0.0;
    final double totleIndent = _indent + _endIndent;
    // Constant definition
    final bool isAxis = axis == Axis.horizontal;
    final double totle = isAxis ? size.width : size.height;
    final double _totle = isAxis ? size.height : size.width;
    final double wavyLength = totle - totleIndent;
    double lastOffset = 0.0;
    final double _a = a ?? 1;
    final double _w = w ?? 1;
    final double _k = k ?? 0;
    // Location distinction
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
    // Start drawing
    final Path path = Path();
    path.moveTo(isAxis ? _indent : lastOffset, isAxis ? lastOffset : _indent);
    for (double x = _indent; x < wavyLength; x += 0.5) {
      final double offsetY = _a * sin(_w * x) + _k;
      final double y = offsetY + lastOffset;
      path.lineTo(isAxis ? x : y, isAxis ? y : x);
    }
    canvas.drawPath(path, paint);
  }
}
