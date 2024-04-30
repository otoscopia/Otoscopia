import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

import 'display/colors_settings.dart';
import 'display/text_settings.dart';

class DisplaySettings extends ConsumerWidget {
  const DisplaySettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText('Display', style: 5),
        Gap(8),
        WidgetExpander(
          icon: FluentIcons.color_solid,
          title: "Colors",
          subtitle: "Modify Theme Mode and Accent Colors",
          content: ColorsSettings(),
        ),
        Gap(4),
        WidgetExpander(
          icon: FluentIcons.font_color,
          title: "Text Size",
          subtitle: "Modify Text Size and Font Family",
          content: TextSettings(),
        ),
      ],
    );
  }
}
