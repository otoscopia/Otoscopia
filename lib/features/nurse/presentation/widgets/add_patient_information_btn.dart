import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class AddPatientInformationBtn extends ConsumerWidget {
  const AddPatientInformationBtn(this._form, {super.key});

  final PatientFormEntity _form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasValue = ref.read(patientProvider).id.isNotEmpty;

    return Button(
      onPressed: () {
        bool isValid = _form.isValid;

        if (!isValid) {
          popUpInfoBar(
            kErrorTitle,
            kErrorMessage,
            context,
            barSeverity: InfoBarSeverity.warning,
          );
          return;
        }

        ref.read(patientProvider.notifier).setPatient(ref, _form);
        ref.read(addPatientTabProvider.notifier).addLeftCamera();
      },
      style: ButtonStyle(
        backgroundColor: ButtonState.resolveWith((states) {
          if (states.contains(ButtonStates.hovering)) {
            return AppColors.accentColor.darker;
          }
          return AppColors.accentColor.dark;
        }),
        foregroundColor: ButtonState.resolveWith((states) {
          if (states.contains(ButtonStates.hovering)) {
            return Colors.black;
          }
          return null;
        }),
      ),
      child: Text(hasValue ? kUpdateBtn : kContinueBtn),
    );
  }
}
