import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class AppNavigation extends ConsumerWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriber = realtime.subscribe([
      'databases.${Env.database}.collections.${Env.screeningCollection}.documents'
    ]);

    subscriber.stream.listen((event) {
      try {
        ref.read(tableProvider.notifier).fromSnapshot(event.payload);
      } catch (e) {
        popUpInfoBar(kErrorTitle, e.toString(), context);
      }
    });

    UserEntity user = ref.read(userProvider);
    return ApplicationContainer(
      child: NavigationView(
        pane: NavigationPane(
          displayMode: PaneDisplayMode.compact,
          size: const NavigationPaneSize(openMaxWidth: 300),
          selected: ref.watch(appIndexProvider),
          onChanged: (i) => ref.watch(appIndexProvider.notifier).setIndex(i),
          header: const Logo(),
          autoSuggestBox: const SearchBox(),
          items: navigationItems(user.role),
          footerItems: footerItems(ref, context),
        ),
      ),
    );
  }
}
