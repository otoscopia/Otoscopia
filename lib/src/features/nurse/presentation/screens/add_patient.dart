import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class AddPatient extends ConsumerWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      padding: const EdgeInsets.all(5),
      child: Card(
        borderColor: AppColors.accentColor.darkest.withOpacity(.1),
        padding: EdgeInsets.zero,
        backgroundColor: FluentTheme.of(context).cardColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
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
