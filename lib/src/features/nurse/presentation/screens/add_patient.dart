import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/presentation/widgets/widgets.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class AddPatient extends ConsumerWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      padding: const EdgeInsets.all(5),
      child: CardOpacity(
        padding: const EdgeInsets.all(0),
        child: TabView(
          currentIndex: ref.watch(addPatientIndexProvider),
          tabs: ref.watch(addPatientTabProvider),
          closeButtonVisibility: CloseButtonVisibilityMode.never,
          onChanged: (value) {
            ref.read(addPatientIndexProvider.notifier).setIndex(value);
          },
        ),
      ),
    );
  }
}
