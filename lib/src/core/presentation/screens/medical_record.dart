import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class MedicalRecord extends ConsumerStatefulWidget {
  const MedicalRecord(this._table, {super.key});
  final TableEntity _table;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends ConsumerState<MedicalRecord> {
  TableEntity? table;
  final controller = FlyoutController();
  final contextAttacKey = GlobalKey();
  final remarksController = TextEditingController();
  final bool isUploading = false;
  DateTime? followUpDate;
  RecordStatus? recordStatus;

  @override
  void initState() {
    super.initState();
    recordStatus = widget._table.screening.status;
    table = widget._table;
  }

  @override
  Widget build(BuildContext context) {
    final patient = table!.patient;
    final screening = table!.screening;
    final bool modified = screening.status != RecordStatus.pending;

    return GestureDetector(
      onSecondaryTapUp: (details) {
        onRightClick(details);
      },
      child: FlyoutTarget(
        key: contextAttacKey,
        controller: controller,
        child: DoubleCard(
          scroll: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PatientInformationCard(patient),
              const Gap(8),
              if (modified) DoctorsRemarkCard(screening),
              if (modified) const Gap(8),
              VitalsCard(screening),
              const Gap(8),
              ScreeningInformationCard(screening),
              const Gap(8),
              EarImages("$kLeftEar:", table!.screening.images, isNetwork: true),
              const Gap(8),
              EarImages("$kRightEar:", table!.screening.images,
                  isNetwork: true),
            ],
          ),
        ),
      ),
    );
  }

  void onRightClick(TapUpDetails details) {
    final isDoctor = ref.read(userProvider).role == UserRole.doctor;
    final targetContext = contextAttacKey.currentContext;
    if (targetContext == null) return;
    final box = targetContext.findRenderObject() as RenderBox;
    final position = box.localToGlobal(
      details.localPosition,
      ancestor: Navigator.of(context).context.findRenderObject(),
    );

    controller.showFlyout(
      position: position,
      builder: (context) {
        return MenuFlyout(
          items: [
            if (isDoctor)
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.edit),
                text: const Text(kModifyBtn),
                onPressed: () async {
                  Flyout.of(context).close();
                  WidgetsFlutterBinding.ensureInitialized()
                      .addPostFrameCallback((timeStamp) async {
                    await showEditContent();
                  });
                },
              ),
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.print),
              text: const Text(kPrintBtn),
              onPressed: () {
                Flyout.of(context).close();
              },
            ),
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.contact_card),
              text: const Text(kPatientDetails),
              onPressed: () {
                ref
                    .read(appIndexProvider.notifier)
                    .visitPatient(table!.patient);
              },
            )
          ],
        );
      },
    );
  }

  Future<void> showEditContent() async {
    await showDialog(
      dismissWithEsc: false,
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text(kModifyMedicalRecordStatus),
          content: ContentPopUpDialog(
            controller: remarksController,
            followUpDate: (value) => setState(() => followUpDate = value),
            status: (value) => setState(() => recordStatus = value),
          ),
          actions: [
            if (isUploading)
              const Center(child: ProgressRing())
            else
              Button(
                child: const Text(kSaveBtn),
                onPressed: () async {
                  onSave();
                },
              ),
            FilledButton(
              child: const Text(kCancelBtn),
              onPressed: () {
                table = widget._table;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  void onSave() async {
    if (remarksController.text.isEmpty && recordStatus == RecordStatus.pending) {
      popUpInfoBar(kErrorTitle, "Please modify the record or select cancel to exit.", context);
      return;
    }

    if (remarksController.text.isEmpty) {
      popUpInfoBar(kErrorTitle, "Remarks must not be empty.", context);
    }

    if (recordStatus == RecordStatus.pending) {
      popUpInfoBar(kErrorTitle, "Please select a status before continuing", context);
      return;
    }
    
    if (recordStatus ==
            RecordStatus.followUp &&
        followUpDate == null) {
      popUpInfoBar(kErrorTitle, kFollowUpDateEmpty, context);
      return;
    }

    final record = table!.screening;

    final updatedScreening = record.copyWith(status: recordStatus);

    final updatedTable = table!.copyWith(screening: updatedScreening);

    table = updatedTable;

    ref.read(screeningsProvider.notifier).updateStatus(updatedScreening);

    ref.read(tableProvider.notifier).updateTable(updatedTable);

    await ref.read(postRemarkProvider.notifier).postRemark(
          remarksController.text,
          followUpDate,
          record.id,
          recordStatus!,
        );

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Navigator.of(context).pop();
    });
  }
}
