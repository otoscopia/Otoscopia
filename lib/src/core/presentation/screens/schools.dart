import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class Schools extends ConsumerWidget {
  const Schools({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabView(
      currentIndex: ref.watch(schoolsIndexProvider),
      tabs: ref.watch(schoolsTabProvider),
      onChanged: (value) {
        ref.read(schoolsIndexProvider.notifier).setIndex(value);
      },
    );
  }
}
