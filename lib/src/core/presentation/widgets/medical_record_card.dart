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
        onTap: () => print('ad'),
        child: VitalsCard(_record),
      ),
    );
  }
}
