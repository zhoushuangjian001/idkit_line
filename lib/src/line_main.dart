import 'package:flutter/material.dart';
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
  }) : super(key: key);

  ///
  final double? width;

  ///
  final double? height;

  final LineType type;

  final double? thickness;

  final Axis axis;

  final LineAlign align;

  final Color? color;

  final double? indent;
  final double? endIndent;

  final double? a;
  final double? w;
  final double? k;

  final DottedType dottedType;

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
              ),
            );
          },
        ),
      ),
    );
  }
}
