import 'package:flutter/widgets.dart';

class ScreenUtil {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double screenPaddingTop = 0;
  static double screenPaddingBottom = 0;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    screenPaddingTop = mediaQuery.padding.top;
    screenPaddingBottom = mediaQuery.padding.bottom;
  }
}
