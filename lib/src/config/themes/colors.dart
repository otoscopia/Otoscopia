import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

class AppColors {
  static const Color primary = Color(0xFF008080);
  static const Color secondary = Color(0xFF005858);
  static const Color transparent = Colors.transparent;

  static final accentColor = SystemTheme.accentColor.accent.toAccentColor();

  static final List<Map<String, Object>> accentColors = [
    {"color": accentColor, "name": "System"},
    {"color": Colors.yellow, "name": "Light Yellow"},
    {"color": Colors.orange, "name": "Orange"},
    {"color": Colors.red, "name": "Red"},
    {"color": Colors.magenta, "name": "Pink"},
    {"color": Colors.purple, "name": "Lavander"},
    {"color": Colors.blue, "name": "Blue"},
    {"color": Colors.teal, "name": "Teal"},
    {"color": Colors.green, "name": "Green"},
  ];
}
