import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class ContentPopUpDialog extends ConsumerStatefulWidget {
  const ContentPopUpDialog({
    super.key,
    required this.controller,
    required this.status,
    required this.followUpDate,
  });

  final TextEditingController controller;
  final void Function(RecordStatus) status;
  final void Function(DateTime?) followUpDate;

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
        TextFormInput(kRemarks, widget.controller, maxLines: 3),
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

                        widget.status(recordStatus!);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
        const Gap(8),
        if (recordIndex == 0)
          InfoLabel(
            label: kFollowUpDate,
            child: DatePicker(
              selected: followUpDate,
              startDate: DateTime.now(),
              onChanged: widget.followUpDate,
            ),
          ),
      ],
    );
  }
}
