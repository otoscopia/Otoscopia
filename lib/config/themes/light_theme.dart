import 'package:fluent_ui/fluent_ui.dart';

import 'colors.dart';

class LightTheme {
  static final themeData = FluentThemeData(
    brightness: Brightness.light,
    accentColor: AppColors.accentColor,
    typography: Typography.fromBrightness(brightness: Brightness.light).merge(
      const Typography.raw(
        display: TextStyle(fontSize: 56),
        title: TextStyle(fontSize: 24, color: Color(0xE4000000)),
      ),
    ),
  );
}
