import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class DoubleCard extends ConsumerWidget {
  const DoubleCard({super.key, required this.child, this.scroll = false});
  final Widget child;
  final bool scroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      padding: const EdgeInsets.all(5),
      child: CardOpacity(
        child: scroll
            ? SingleChildScrollView(
                padding: const EdgeInsets.only(right: 20.0),
                child: child,
              )
            : child,
      ),
    );
  }
}
