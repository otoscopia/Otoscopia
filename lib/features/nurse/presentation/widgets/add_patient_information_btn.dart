import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class AddPatientInformationBtn extends ConsumerWidget {
  const AddPatientInformationBtn({
    super.key,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.school,
    required this.idNumber,
    required this.guardiansName,
    required this.guardiansPhone,
  });

  final String name;
  final int? gender;
  final DateTime? birthDate;
  final String school;
  final String idNumber;
  final String guardiansName;
  final String guardiansPhone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasValue = ref.read(addPatientInformationProvider).name.isNotEmpty;
    bool hasError = name.isEmpty ||
        gender == null ||
        birthDate == DateTime.now() ||
        school.isEmpty ||
        idNumber.isEmpty ||
        guardiansName.isEmpty ||
        guardiansPhone.isEmpty;

    return Button(
      onPressed: () {
        if (hasError) {
          popUpInfoBar(
            kErrorTitle,
            kErrorMessage,
            context,
            barSeverity: InfoBarSeverity.warning,
          );
          return;
        }
        PatientEntity patient = PatientEntity(
          id: uuid.v4(),
          name: name,
          gender: Gender.values[gender!],
          birthDate: birthDate!,
          school: school,
          idNumber: idNumber,
          guardian: guardiansName,
          guardianPhone: guardiansPhone,
          creator: ref.read(userProvider).id,
          doctor: shuffleDoctor(ref).id,
          code: generateCode(name, birthDate!),
        );

        ref.read(addPatientInformationProvider.notifier).setPatient(patient);
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
