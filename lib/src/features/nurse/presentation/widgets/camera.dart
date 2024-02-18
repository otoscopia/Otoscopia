import 'dart:math' as math;

import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class Camera extends ConsumerStatefulWidget {
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
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraState();
}

class _CameraState extends ConsumerState<Camera> {
  bool _invert = true;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = widget.previewSize!.width / widget.previewSize!.height;

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
              aspectRatio: aspectRatio,
              child: _invert ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CameraPlatform.instance.buildPreview(widget.cameraId),
              ) : CameraPlatform.instance.buildPreview(widget.cameraId),
            ),
          ),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.hasMultipleCameras)
              FilledButton(
                onPressed: widget.switchCamera,
                child: const Text(kSwitchCameraBtn),
              ),
            const Gap(16),
            FilledButton(
                onPressed: widget.takePicture, child: const Text(kCaptureBtn)),
            const Gap(16),
            FilledButton(
              child: const Text(kContinueBtn),
              onPressed: () => widget.continueButton(context),
            ),
            const Gap(16),
            FilledButton(
              child: const Text("Invert Camera"),
              onPressed: () => setState(() => _invert = !_invert),
            ),
          ],
        ),
      ],
    );
  }
}
