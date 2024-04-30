import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class AdminNavigation extends ConsumerWidget {
  const AdminNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = NavigationEntity(context, ref);
    return ApplicationContainer(
      child: NavigationView(
        pane: NavigationPane(
          displayMode: PaneDisplayMode.compact,
          size: const NavigationPaneSize(openMaxWidth: 300),
          selected: ref.watch(appIndexProvider),
          onChanged: (i) => ref.watch(appIndexProvider.notifier).setIndex(i),
          header: const Logo(),
          autoSuggestBox: const SearchBox(),
          items: navigation.adminItems,
          footerItems: navigation.footer,
          autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        ),
      ),
    );
  }
}