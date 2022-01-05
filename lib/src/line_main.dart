import 'package:flutter/material.dart'
    show StatelessWidget, Axis, Key, Color, Container, LayoutBuilder, BuildContext, BoxConstraints, SizedBox, CustomPaint, Size, Colors, Widget;
import 'package:idkit_line/idkit_line.dart';
import 'package:idkit_line/src/line_config.dart';
import 'package:idkit_line/src/line_painter.dart';

class IDKitLine extends StatelessWidget {
  const IDKitLine({
    Key? key,
    this.width,
    this.height,
    this.type = LineType.solid,
    this.thickness,
    this.axis = Axis.horizontal,
    this.align = LineAlign.center,
    this.color,
    this.indent,
    this.endIndent,
    this.a,
    this.w,
    this.k,
    this.dottedType = DottedType.dash,
    this.dashLength,
    this.interval,
  }) : super(key: key);

  /// Factory method of solid line
  factory IDKitLine.solid({
    Key? key,
    double? width,
    double? height,
    double? thickness,
    Axis axis = Axis.horizontal,
    LineAlign align = LineAlign.center,
    Color? color,
    double? indent,
    double? endIndent,
  }) =>
      IDKitLine(
        key: key,
        width: width,
        height: height,
        thickness: thickness,
        axis: axis,
        align: align,
        color: color,
        indent: indent,
        endIndent: endIndent,
      );

  /// Wavy line factory method
  factory IDKitLine.wavy({
    Key? key,
    double? width,
    double? height,
    LineType type = LineType.wavy,
    double? thickness,
    Axis axis = Axis.horizontal,
    LineAlign align = LineAlign.center,
    Color? color,
    double? indent,
    double? endIndent,
    double? a,
    double? w,
    double? k,
  }) =>
      IDKitLine(
        key: key,
        width: width,
        height: height,
        type: type,
        thickness: thickness,
        axis: axis,
        align: align,
        color: color,
        indent: indent,
        endIndent: endIndent,
        a: a,
        w: w,
        k: k,
      );

  /// Dotted factory method
  factory IDKitLine.dotted({
    Key? key,
    double? width,
    double? height,
    LineType type = LineType.dotted,
    double? thickness,
    Axis axis = Axis.horizontal,
    LineAlign align = LineAlign.center,
    Color? color,
    double? indent,
    double? endIndent,
    DottedType dottedType = DottedType.dash,
    double? dashLength,
    double? interval,
  }) =>
      IDKitLine(
        key: key,
        width: width,
        height: height,
        type: type,
        thickness: thickness,
        axis: axis,
        align: align,
        color: color,
        indent: indent,
        endIndent: endIndent,
        dottedType: dottedType,
        dashLength: dashLength,
        interval: interval,
      );

  /// The width of the carrier to draw the line
  final double? width;

  /// The height of the carrier to draw the line
  final double? height;

  /// Type of drawing line
  final LineType type;

  /// The thickness of the drawn line
  final double? thickness;

  /// The direction of the drawn line
  final Axis axis;

  /// The position of the drawn line
  final LineAlign align;

  /// The color of the drawn line
  final Color? color;

  /// Start indentation of the line drawn
  final double? indent;

  /// End indentation of the line drawn
  final double? endIndent;

  /// Draw the amplitude of the wave line
  final double? a;

  /// Angular velocity for drawing wavy lines
  final double? w;

  /// Draw the offset of the wavy line
  final double? k;

  /// Type of dashed line
  final DottedType dottedType;

  /// The length of the dashed line
  final double? dashLength;

  /// Space between dotted elements
  final double? interval;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: Colors.red,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            Size painterSize = Size.zero;
            if (constraints.isTight) {
              painterSize = Size(constraints.minWidth, constraints.minHeight);
            } else if (constraints.isNormalized) {
              painterSize = Size(constraints.maxWidth, constraints.maxHeight);
            }
            return CustomPaint(
              size: painterSize,
              painter: LinePainter(
                context,
                type: type,
                axis: axis,
                align: align,
                thickness: thickness,
                color: color,
                a: a,
                w: w,
                k: k,
                dottedType: dottedType,
                dashLength: dashLength,
                interval: interval,
              ),
            );
          },
        ),
      ),
    );
  }
}
