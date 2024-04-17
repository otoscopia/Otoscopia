import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/settings/settings.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DoubleCard(
      scroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('Settings', style: 1),
          Gap(12),
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
      ),
    );
  }
}
