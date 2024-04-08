import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/features/settings/settings.dart';

export 'colors.dart';

class ThemeEntity {
  final SettingsEntity _settings;

  ThemeEntity(this._settings);

  FluentThemeData get lightMode {
    return FluentThemeData(
      accentColor: _settings.accentColor,
      visualDensity: VisualDensity.comfortable,
    );
  }

  FluentThemeData get darkMode {
    return FluentThemeData(
      brightness: Brightness.dark,
      accentColor: _settings.accentColor,
      visualDensity: VisualDensity.comfortable,
    );
  }

  ThemeMode get themeMode => _settings.themeMode;
}
