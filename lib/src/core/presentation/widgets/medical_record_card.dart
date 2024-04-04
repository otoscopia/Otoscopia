import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class MedicalRecordCard extends ConsumerWidget {
  const MedicalRecordCard(this._record, {super.key});
  final ScreeningEntity _record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: getRemarks(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LoadingWidget());
        }
        final remarks = snapshot.data as List<RemarksEntity>;
        final remark = remarks.isNotEmpty ? remarks.first : null;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              ref.read(appIndexProvider.notifier).setIndex(0);
              ref
                  .read(dashboardTabProvider.notifier)
                  .viewRecord(_record, remarks: remark);
            },
            child: VitalsCard(_record, remarks: remark, isOverview: true),
          ),
        );
      },
    );
  }

  Future<List<RemarksEntity>> getRemarks(WidgetRef ref) async {
    final remarks =
        await ref.read(fetchDataProvider.notifier).getRemarks(_record.id);
    return remarks;
  }
}
