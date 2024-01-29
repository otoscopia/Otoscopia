import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';

class DoubleCard extends ConsumerWidget {
  const DoubleCard({super.key, required this.child, this.scroll = false});
  final Widget child;
  final bool scroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      padding: const EdgeInsets.all(5),
      child: Card(
        borderColor: AppColors.accentColor.darkest.withOpacity(.1),
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        backgroundColor: FluentTheme.of(context).cardColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
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
