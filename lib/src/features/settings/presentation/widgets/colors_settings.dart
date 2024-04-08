import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/settings/settings.dart';

class ColorsSettings extends ConsumerWidget {
  const ColorsSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(settingsProvider.notifier);
    final settings = ref.watch(settingsProvider);
    final colors = AppColors();

    const width = 150.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedBackground(
          child: ListTile(
            leading: const Icon(FluentIcons.contrast),
            title: const CustomText('Theme Mode'),
            subtitle:
                const CustomText("Change the theme that appears in the system"),
            trailing: SizedBox(
              width: width,
              child: ComboBox<ThemeMode>(
                isExpanded: true,
                items: settings.themeModes
                    .map((mode) => ComboBoxItem(
                          value: mode["mode"] as ThemeMode,
                          child: CustomText(mode["name"] as String),
                        ))
                    .toList(),
                onChanged: (value) => provider.setThemeMode(value!),
                value: settings.themeMode,
              ),
            ),
          ),
        ),
        const Gap(8),
        RoundedBackground(
          child: ListTile(
            leading: const Icon(FluentIcons.color),
            title: const CustomText('Accent Color'),
            subtitle: const CustomText(
                "Change the color of the primary elements of the app"),
            trailing: SizedBox(
              width: width,
              child: ComboBox<AccentColor>(
                isExpanded: true,
                items: colors.accentColors
                    .map((color) => ComboBoxItem(
                          value: color['color'] as AccentColor,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: color['color'] as AccentColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Gap(8),
                              CustomText(color['name'] as String),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) => provider.setAccentColor(value!),
                value: settings.accentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
