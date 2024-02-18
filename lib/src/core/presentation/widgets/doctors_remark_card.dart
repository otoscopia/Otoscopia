import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class DoctorsRemarkCard extends ConsumerWidget {
  const DoctorsRemarkCard(this.screening, {super.key});
  final ScreeningEntity screening;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardOpacity(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText("Doctors Remarks", style: 1),
          const Gap(8),
          FutureBuilder(
            future:
                ref.read(fetchDataProvider.notifier).getRemarks(screening.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }

              final remark = snapshot.data as RemarksEntity;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity),
                  CustomText("Remarks: ${remark.remarks}"),
                  if (screening.status != RecordStatus.followUp) const Gap(8),
                  if (screening.status != RecordStatus.followUp)
                    CustomText(
                      "Follow up date: ${remark.followUpDate}",
                      style: 3,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
