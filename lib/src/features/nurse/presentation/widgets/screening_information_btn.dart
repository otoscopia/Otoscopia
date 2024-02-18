import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class ScreeningInformationBtn extends ConsumerWidget {
  const ScreeningInformationBtn({super.key, required this.medical});

  final MedicalFormEntity medical;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasValue = ref.read(screeningInformationProvider).id.isNotEmpty;
    return FilledButton(
      child: Text(hasValue ? kUpdateBtn : kProceedBtn),
      onPressed: () {
        final bool isValid = medical.isValid;
        if (!isValid) {
          popUpInfoBar(
            kErrorTitle,
            kErrorMessage,
            context,
            barSeverity: InfoBarSeverity.warning,
          );
          return;
        }

        ref
            .read(screeningInformationProvider.notifier)
            .setScreening(ref, medical);
        ref.read(addPatientTabProvider.notifier).addReview();
      },
    );
  }
}
