import 'package:flutter/material.dart';

class ScreenUtil {
  /// 当前屏幕 宽
  static double screenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }

  /// 当前屏幕 宽
  static double screenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }

  /// status bar Height
  /// 当前状态栏高度
  static double getStatusBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top;
  }
}