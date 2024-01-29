import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class Doctors extends ConsumerWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabView(
      currentIndex: ref.watch(doctorsIndexProvider),
      tabs: ref.watch(doctorsTabProvider),
      onChanged: (value) {
        ref.read(doctorsIndexProvider.notifier).setIndex(value);
      },
    );
  }
}
