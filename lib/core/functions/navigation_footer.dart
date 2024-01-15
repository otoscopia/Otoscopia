import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

List<NavigationPaneItem> footerItems(WidgetRef ref, BuildContext context) {
  return [
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.settings),
      title: const Text(kSettings),
      body: Container(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.player_settings),
      title: const Text(kProfile),
      body: Container(),
    ),
    PaneItemAction(
      icon: const Icon(FluentIcons.power_button),
      title: const Text(kLogout),
      onTap: () async {
        await ref.read(authenticationProvider.notifier).logout();

        WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, kInitialRoute, (route) => false);
        });
      },
    )
  ];
}
