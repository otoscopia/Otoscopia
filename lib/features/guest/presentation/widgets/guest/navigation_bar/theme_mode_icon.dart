import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'package:otoscopia/core/core.dart';

class ThemeModeIcon extends ConsumerWidget {
  const ThemeModeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(themeProvider);
    IoniconsData iconData = themeMode == ThemeMode.system
        ? Ionicons.invert_mode
        : themeMode == ThemeMode.light
            ? Ionicons.sunny
            : Ionicons.moon;

    return IconButton(
      icon: Icon(iconData, size: 18),
      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
      style: ButtonStyle(
        foregroundColor: ButtonState.resolveWith((states) {
          if (states.isHovering) return FluentTheme.of(context).accentColor;
          return FluentTheme.of(context).typography.body!.color;
        }),
      ),
    );
  }
}
