import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class DoctorsInfo extends ConsumerWidget {
  const DoctorsInfo(this._doctors, {super.key});
  final UsersEntity _doctors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patients = ref.read(patientsProvider.notifier).findByDoctorId(_doctors.id);
    return DoubleCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _doctors.name,
            style: FluentTheme.of(context).typography.title,
          ),
          Text(
            _doctors.email,
            style: FluentTheme.of(context).typography.caption,
          ),
          Text(
            _doctors.workAddress,
            style: FluentTheme.of(context).typography.caption,
          ),
          const Gap(8),
          const Divider(),
          const Gap(4),
          DoctorsPatient(patients),
        ],
      ),
    );
  }
}
