import 'package:flutter/material.dart' show Offset;

/// Type of drawing line
enum LineType {
  solid,
  dotted,
  wavy,
}

/// Line drawing position
enum LineAlign {
  top,
  center,
  bottom,
  left,
  right,
}

/// Type of dashed line
enum DottedType {
  dot,
  dash,
  dash_dot,
}

/// Exchange dx and dy of offset, and return the new offset
extension IDKitOffset on Offset {
  Offset exchange() => Offset(dy, dx);
}
