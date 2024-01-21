import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/core/presentation/widgets/loading_widget.dart';

class AppNavigation extends ConsumerStatefulWidget {
  const AppNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppNavigationState();
}

class _AppNavigationState extends ConsumerState<AppNavigation> {
  TextEditingController controller = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    UserEntity user = ref.read(userProvider);
    return ApplicationContainer(
      child: FutureBuilder(
        future: ref.read(fetchDataProvider.notifier).fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }

          return NavigationView(
            pane: NavigationPane(
              displayMode: PaneDisplayMode.compact,
              size: const NavigationPaneSize(openMaxWidth: 300),
              selected: selectedIndex,
              onChanged: (i) => setState(() => selectedIndex = i),
              header: const Logo(),
              autoSuggestBox: SearchBox(controller: controller),
              items: navigationItems(user.role),
              footerItems: footerItems(ref, context),
            ),
          );
        },
      ),
    );
  }
}
