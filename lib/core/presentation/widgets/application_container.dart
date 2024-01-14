import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'offline_bottom_bar.dart';

class ApplicationContainer extends ConsumerWidget {
  const ApplicationContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OfflineBuilder(
      connectivityBuilder: (context, connectivity, child) {
        final bool connected = connectivity != ConnectivityResult.none;

        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            OfflineBottomBar(connected),
          ],
        );
      },
      child: ScaffoldPage(
        padding: EdgeInsets.zero,
        content: child,
      ),
    );
  }
}
