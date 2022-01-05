import 'package:flutter/material.dart';
import 'package:idkit_line/src/line_config.dart';
import 'package:idkit_line/src/line_mixin.dart';

class LinePainter extends CustomPainter with LinePainterMixin {
  const LinePainter(
    this.context, {
    this.type,
    this.axis,
    this.align,
    this.dottedType,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
    this.a,
    this.w,
    this.k,
    this.dashLength,
    this.interval,
  });
  final BuildContext context;
  final LineType? type;
  final Axis? axis;
  final double? thickness;
  final Color? color;
  final LineAlign? align;
  final double? indent;
  final double? endIndent;
  final double? a;
  final double? w;
  final double? k;
  final DottedType? dottedType;
  final double? dashLength;
  final double? interval;
  @override
  void paint(Canvas canvas, Size size) {
    /// 画笔设置
    final double _thickness = thickness ?? 1.0;
    final Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = _thickness;
    paint.color = color ?? DividerTheme.of(context).color ?? Theme.of(context).primaryColor;
    switch (type) {
      case LineType.dotted:
        drawDotted(
          canvas: canvas,
          size: size,
          paint: paint,
          thickness: _thickness,
          align: align,
          axis: axis,
          dashLength: dashLength,
          interval: interval,
          type: dottedType,
        );
        break;
      case LineType.wavy:
        drawWavy(
          canvas: canvas,
          size: size,
          paint: paint,
          indent: indent,
          axis: axis,
          align: align,
          thickness: _thickness,
          endIndent: endIndent,
          a: a,
          w: w,
          k: k,
        );
        break;
      default:
        drawSolid(
          canvas: canvas,
          size: size,
          paint: paint,
          axis: axis,
          align: align,
          indent: indent,
          endIndent: endIndent,
          thickness: _thickness,
        );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
