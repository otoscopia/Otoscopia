import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:otoscopia/core/core.dart';

import 'navigation_content.dart';

class NavigationBar extends ConsumerWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 451;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        if (responsive) const NavigationContent(),
      ],
    );
  }
}
