import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/features/settings/settings.dart';

/// Use case for the settings repository
class SettingsUseCase {
  final SettingsRepository _repository;

  SettingsUseCase(this._repository);

  /// Update the user's theme mode
  Future<void> updateTheme(ThemeMode themeMode) async {
    return await _repository.updateTheme(themeMode);
  }

  /// Update the user's accent color
  Future<void> updateAccentColor(AccentColor accentColor) async {
    return await _repository.updateAccentColor(accentColor);
  }

  /// Update the user's font size
  Future<void> updateFontSize(double fontSize) async {
    return await _repository.updateFontSize(fontSize);
  }

  /// Update the user's font family
  Future<void> updateFontFamily(String fontFamily) async {
    return await _repository.updateFontFamily(fontFamily);
  }
}
