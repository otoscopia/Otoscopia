import 'package:fluent_ui/fluent_ui.dart';

/// Abstract class for the settings repository
abstract class SettingsRepository {
  /// Update the user's theme mode
  Future<void> updateTheme(ThemeMode themeMode);

  /// Update the user's accent color
  Future<void> updateAccentColor(AccentColor accentColor);

  /// Update the user's font size
  Future<void> updateFontSize(double fontSize);

  /// Update the user's font family
  Future<void> updateFontFamily(String fontFamily);
}
