import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class MedicalRecordCard extends ConsumerWidget {
  const MedicalRecordCard(this._record, {super.key});
  final ScreeningEntity _record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref.read(appIndexProvider.notifier).setIndex(0);
          ref.read(dashboardTabProvider.notifier).viewRecord(_record);
        },
        child: VitalsCard(_record),
      ),
    );
  }
}
