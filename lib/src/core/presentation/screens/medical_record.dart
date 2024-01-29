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
  }

  @override
  Widget build(BuildContext context) {
    final patient = widget._table.patient;
    final screening = widget._table.screening;

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
              VitalsCard(screening),
              const Gap(8),
              ScreeningInformationCard(screening),
              const Gap(8),
              EarImages("$kLeftEar:", widget._table.screening.images),
              const Gap(8),
              EarImages("$kRightEar:", widget._table.screening.images),
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
                text: const Text("Modify"),
                onPressed: () async {
                  await showEditContent();
                  WidgetsFlutterBinding.ensureInitialized()
                      .addPostFrameCallback((timeStamp) {
                    Flyout.of(context).close();
                  });
                },
              ),
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.print),
              text: const Text("Print"),
              onPressed: () {
                Flyout.of(context).close();
              },
            ),
            MenuFlyoutItem(
              leading: const Icon(FluentIcons.contact_card),
              text: const Text("Patient Details"),
              onPressed: () {
                ref
                    .read(appIndexProvider.notifier)
                    .visitPatient(widget._table.patient);
              },
            )
          ],
        );
      },
    );
  }

  Future<void> showEditContent() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text("Modify Medical Record Status"),
          content: ContentPopUpDialog(
            remarksController,
            (value) => setState(() => recordStatus = value),
            (value) => setState(() => followUpDate = value),
          ),
          actions: [
            if (isUploading)
              const Center(child: ProgressRing())
            else
              Button(
                child: const Text("Save"),
                onPressed: () async {
                  widget._table.screening.copyWith(status: recordStatus);
                  await ref.read(postRemarkProvider.notifier).postRemark(
                        remarksController.text,
                        followUpDate,
                        widget._table.screening.id,
                        recordStatus!,
                      );

                  WidgetsFlutterBinding.ensureInitialized()
                      .addPostFrameCallback((timeStamp) {
                    Navigator.of(context).pop();
                  });

                  setState(() {});
                },
              ),
            FilledButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}
