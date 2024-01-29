import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class ContentPopUpDialog extends ConsumerStatefulWidget {
  const ContentPopUpDialog(
    this.remarksController,
    this.onStatusChanged,
    this.onFollowUpDateChanged, {
    super.key,
  });

  final TextEditingController remarksController;
  final void Function(RecordStatus) onStatusChanged;
  final void Function(DateTime?) onFollowUpDateChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContentPopUpDialogState();
}

class _ContentPopUpDialogState extends ConsumerState<ContentPopUpDialog> {
  DateTime? followUpDate;
  int? recordIndex;
  RecordStatus? recordStatus;

  final statusText = [kFollowUp, kMedicalAttention, kResolved];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const InfoBar(
          title: Text(kNote),
          content: Text(kNotice),
          severity: InfoBarSeverity.warning,
          isLong: false,
        ),
        TextFormInput(kRemarks, widget.remarksController, maxLines: 3),
        const Gap(8),
        InfoLabel(
          label: kMedicalRecordStatus,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              statusText.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: RadioButton(
                    checked: recordIndex == index,
                    content: Text(statusText[index]),
                    onChanged: (checked) {
                      if (checked) {
                        setState(() {
                          recordIndex = index;
                          recordStatus = RecordStatus.values[index + 1];
                        });
                        widget.onStatusChanged(recordStatus!);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
