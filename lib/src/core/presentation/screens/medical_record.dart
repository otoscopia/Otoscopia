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
  final location = TextEditingController();
  final bool isUploading = false;
  DateTime? date;
  RecordStatus? recordStatus;
  late bool isDoctor;

  @override
  void initState() {
    super.initState();
    isDoctor = ref.read(userProvider).role == UserRole.doctor;

    recordStatus = widget._table.remarks != null
        ? widget._table.remarks!.status
        : RecordStatus.pending;
    table = widget._table;
  }

  @override
  Widget build(BuildContext context) {
    final patient = table!.patient;
    final screening = table!.screening;
    final remarks = table?.remarks;
    final hasRemarks = remarks != null;
    final bool modified =
        hasRemarks ? remarks.status != RecordStatus.pending : false;
    final connection = ref.read(connectionProvider);

    return GestureDetector(
      onSecondaryTapUp: (details) {
        onRightClick(details);
      },
      child: FlyoutTarget(
        key: contextAttacKey,
        controller: controller,
        child: Stack(
          children: [
            DoubleCard(
              scroll: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientInformationCard(patient),
                  const Gap(8),
                  if (modified) DoctorsRemarkCard(screening),
                  if (modified) const Gap(8),
                  VitalsCard(screening, remarks: remarks,),
                  const Gap(8),
                  ScreeningInformationCard(screening),
                  const Gap(8),
                  EarImages(
                    "$kLeftEar:",
                    table!.screening.images,
                    isNetwork: connection,
                  ),
                  const Gap(8),
                  EarImages(
                    "$kRightEar:",
                    table!.screening.images,
                    isNetwork: connection,
                  ),
                ],
              ),
            ),
            if (isDoctor)
              Positioned(
                right: 32,
                bottom: 32,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    child: const Icon(FluentIcons.edit, size: 32),
                    onPressed: () async {
                      await showEditContent();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void onRightClick(TapUpDetails details) {
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
            ),
            if (!isDoctor)
              MenuFlyoutItem(
                leading: const Icon(FluentIcons.add),
                text: const Text("Add New Record"),
                onPressed: () {
                  Flyout.of(context).close();
                },
              ),
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
          constraints: const BoxConstraints(maxWidth: 325),
          title: const Text(kModifyMedicalRecordStatus),
          content: ContentPopUpDialog(
            controller: remarksController,
            location: location,
            date: (value) => setState(() => date = value),
            status: (value) => setState(() => recordStatus = value),
          ),
          actions: [
            if (isUploading)
              const Center(child: ProgressRing())
            else
              FilledButton(
                child: const Text(kSaveBtn),
                onPressed: () async {
                  onSave();
                },
              ),
            Button(
              child: const Text(kCancelBtn),
              onPressed: () {
                table ??= widget._table;
                remarksController.text = "";
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
    final isRemarksNotEmpty = remarksController.text != "";
    final isResolved =
        recordStatus == RecordStatus.resolved && isRemarksNotEmpty;
    final isMedicalAttention = (recordStatus == RecordStatus.medicalAttention &&
        (date != null && location.text != "" && isRemarksNotEmpty));
    final isFollowUp = recordStatus == RecordStatus.followUp &&
        (date != null && location.text != "" && isRemarksNotEmpty);

    if (isResolved || isMedicalAttention || isFollowUp) {
      final remarksEntity =
          await ref.read(postRemarkProvider.notifier).postRemark(
                remarksController.text,
                date,
                table!.screening.id,
                location.text,
                recordStatus!,
              );

      setState(() {
        table = table = TableEntity(
          patient: table!.patient,
          screening: table!.screening,
          remarks: remarksEntity,
        );
      });

      WidgetsFlutterBinding.ensureInitialized()
          .addPostFrameCallback((timeStamp) {
        Navigator.of(context).pop();
        remarksController.text = "";
        location.text = "";
        date = null;
        recordStatus = null;
      });
    } else {
      popUpInfoBar(
          kErrorTitle,
          "Inputs are required and must be completed before submission.",
          context);
    }
  }
}
