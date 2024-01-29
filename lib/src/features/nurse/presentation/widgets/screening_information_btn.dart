import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class ScreeningInformationBtn extends ConsumerWidget {
  const ScreeningInformationBtn({super.key, required this.medical});

  final MedicalFormEntity medical;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasValue = ref.read(screeningInformationProvider).id.isNotEmpty;
    return FilledButton(
      child: Text(hasValue ? kUpdateBtn : kContinueBtn),
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

        final patient = ref.read(patientProvider);
        final path = "$applicationDirectory\\${patient.id}";
        final directory = Directory(path);
        final earImages = directory
            .listSync()
            .where((element) => element.path.contains('jpeg'))
            .toList();
        
        final List<String> images = [];

        for(final image in earImages) {
          images.add(image.path);
        }

        ref
            .read(screeningInformationProvider.notifier)
            .setScreening(ref, medical, images);
        ref.read(addPatientTabProvider.notifier).addReview();
      },
    );
  }
}
