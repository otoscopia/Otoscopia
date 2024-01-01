import 'package:fluent_ui/fluent_ui.dart';

import 'colors.dart';

class DarkTheme {
  static const Color darkScaffoldBackgroundColor = Color(0xFF1B1B1F);
  static const Color dividerColor = Color(0xFF2E2E32);

  static final themeData = FluentThemeData.dark().copyWith(
    accentColor: AppColors.accentColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    dividerTheme: const DividerThemeData(
      decoration: BoxDecoration(color: dividerColor),
    ),
  );
}
