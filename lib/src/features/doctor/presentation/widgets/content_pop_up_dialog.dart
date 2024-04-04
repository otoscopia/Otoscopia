import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class ContentPopUpDialog extends ConsumerStatefulWidget {
  const ContentPopUpDialog({
    super.key,
    required this.controller,
    required this.location,
    required this.status,
    required this.date,
    required this.bytes,
    required this.names,
  });

  final TextEditingController controller;
  final TextEditingController location;
  final void Function(RecordStatus) status;
  final void Function(DateTime?) date;
  final void Function(List<Uint8List>) bytes;
  final void Function(List<String>) names;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContentPopUpDialogState();
}

class _ContentPopUpDialogState extends ConsumerState<ContentPopUpDialog> {
  DateTime? followUpDate;
  int? recordIndex;
  RecordStatus? recordStatus;

  final statusText = [kFollowUp, kMedicalAttention, kResolved];
  bool hasFiles = false;
  List<String> names = [];
  List<Uint8List> bytes = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
        InfoLabel(
          label: "Remarks (Doctors note)",
          child: TextBox(
            controller: widget.controller,
            maxLines: 5,
          ),
        ),
        if (recordIndex != null && recordIndex == 0) const Gap(8),
        if (recordIndex != null && recordIndex == 0)
          // file picker ui
          InfoLabel(
            label: "Attach Prescription",
            child: Button(
              onPressed: () async {
                // file picker
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  dialogTitle: "Select a file to attach",
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'png', 'jpeg', 'jpg'],
                );

                if (result != null) {
                  widget.bytes(result.files.map((e) => e.bytes!).toList());
                  widget.names(result.files.map((e) => e.name).toList());
                  setState(() {
                    names = result.files.map((e) => e.name).toList();
                    bytes = result.files.map((e) => e.bytes!).toList();
                    hasFiles = true;
                  });
                } else {
                  // User canceled the picker
                }
              },
              child: const Text("Attach File"),
            ),
          ),
        if (recordIndex != null && recordIndex == 0 && hasFiles) const Gap(8),
        if (recordIndex != null && recordIndex == 0 && hasFiles)
          InfoLabel(
            label: "Attached Files",
            child: Wrap(
              children: List.generate(
                names.length,
                (index) {
                  return ListTile(
                    title: Text(names[index]),
                    trailing: IconButton(
                      icon: const Icon(FluentIcons.delete),
                      onPressed: () {
                        setState(() {
                          names.removeAt(index);
                          bytes.removeAt(index);
                          widget.names(names);
                          widget.bytes(bytes);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        if (recordIndex != null && recordIndex == 1) const Gap(8),
        if (recordIndex != null && recordIndex == 1)
          InfoLabel(
            label: kFollowUpDate,
            child: DatePicker(
              selected: followUpDate,
              startDate: DateTime.now(),
              onChanged: (date) {
                setState(() => followUpDate = date);
                widget.date(date);
              },
            ),
          ),
        if (recordIndex != null && recordIndex == 1) const Gap(8),
        if (recordIndex != null && recordIndex == 1)
          InfoLabel(
            label: "Follow up Time",
            child: TimePicker(
              selected: followUpDate,
              onChanged: (date) {
                setState(() => followUpDate = date);
                widget.date(date);
              },
            ),
          ),
        if (recordIndex != null && recordIndex == 1) const Gap(8),
        if (recordIndex != null && recordIndex == 1)
          TextFormInput(kLocation, widget.location),
      ],
    );
  }
}
