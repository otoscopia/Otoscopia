import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class PatientsInfo extends ConsumerWidget {
  const PatientsInfo(this.patient, {super.key});
  final PatientEntity patient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records =
        ref.read(screeningsProvider.notifier).findByPatientId(patient.id);

    return DoubleCard(
      scroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PatientInformationCard(patient),
          const Gap(8),
          CardOpacity(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$kMedicalRecord${records.length > 1 ? "s" : ""}",
                  style: FluentTheme.of(context).typography.subtitle,
                ),
                const Gap(8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: MedicalRecordCard(record),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
