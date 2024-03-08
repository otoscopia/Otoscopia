import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

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

              final remarks = snapshot.data as List<RemarksEntity>;

              remarks.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: remarks.asMap().entries.map((entry) {
                    final index = entry.key;
                    final remark = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index != 0)
                              const SizedBox(width: double.infinity),
                            if (index == 0)
                              Row(
                                children: [
                                  Icon(remark.statusIcon,
                                      color: remark.statusColor, size: 32),
                                  const Gap(8),
                                  CustomText(remark.statusString, style: 2),
                                ],
                              )
                            else
                              CustomText("Status: ${remark.statusString}"),
                            CustomText("Doctors Remarks: ${remark.remarks!}"),
                            if (remark.status != RecordStatus.pending &&
                                remark.status != RecordStatus.resolved)
                              CustomText(
                                  "Follow up date: ${DateFormat.yMMMMd().format(remark.date!)}"),
                            if (remark.status != RecordStatus.pending &&
                                remark.status != RecordStatus.resolved)
                              CustomText(
                                  "Follow up time: ${DateFormat.jm().format(remark.date!)}"),
                            if (remark.status != RecordStatus.pending &&
                                remark.status != RecordStatus.resolved)
                              CustomText("Location: ${remark.location}"),
                            CustomText(
                              "Updated at: ${DateFormat.yMMMMd().format(remark.createdAt!)}",
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList());
            },
          ),
        ],
      ),
    );
  }
}
