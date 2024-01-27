import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class Camera extends ConsumerWidget {
  const Camera({
    required this.previewSize,
    required this.cameraId,
    required this.hasMultipleCameras,
    required this.switchCamera,
    required this.takePicture,
    required this.continueButton,
    super.key,
  });

  final Size? previewSize;
  final int cameraId;
  final bool hasMultipleCameras;
  final void Function()? switchCamera;
  final void Function()? takePicture;
  final void Function(BuildContext context) continueButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: 300,
            maxHeight: MediaQuery.of(context).size.height - 191,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: previewSize!.width / previewSize!.height,
              child: CameraPlatform.instance.buildPreview(cameraId),
            ),
          ),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasMultipleCameras)
              FilledButton(
                onPressed: switchCamera,
                child: const Text(kSwitchCameraBtn),
              ),
            const Gap(16),
            FilledButton(
                onPressed: takePicture, child: const Text(kCaptureBtn)),
            const Gap(16),
            FilledButton(
              child: const Text(kContinueBtn),
              onPressed: () => continueButton(context),
            )
          ],
        ),
      ],
    );
  }
}
