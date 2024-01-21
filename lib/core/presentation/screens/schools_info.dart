import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class SchoolsInfo extends ConsumerWidget {
  const SchoolsInfo(this._school, {super.key});
  final SchoolEntity _school;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patients =
        ref.read(patientsProvider.notifier).findBySchoolId(_school.id);
    return DoubleCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _school.name,
            style: FluentTheme.of(context).typography.title,
          ),
          Text(
            _school.address,
            style: FluentTheme.of(context).typography.caption,
          ),
          Text(
            _school.abbr,
            style: FluentTheme.of(context).typography.caption,
          ),
          const Gap(8),
          const Divider(),
          const Gap(4),
          SchoolsPatient(patients),
        ],
      ),
    );
  }
}
