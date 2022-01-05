import 'package:flutter/material.dart' show Offset;

/// 线的类型
enum LineType {
  solid,
  dotted,
  wavy,
}

/// 线的位置
enum LineAlign {
  top,
  center,
  bottom,
  left,
  right,
}

/// 虚线的类型
enum DottedType {
  dot,
  dash,
  dash_dot,
}

/// Offset 交换
extension IDKitOffset on Offset {
  Offset exchange() => Offset(dy, dx);
}
