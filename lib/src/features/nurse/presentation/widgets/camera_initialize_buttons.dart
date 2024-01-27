import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/src/core/core.dart';

class CameraInitializeButtons extends ConsumerWidget {
  const CameraInitializeButtons(
    this._initializeCamera,
    this._refreshCamera,
    this._hasCamera, {
    super.key,
  });

  final void Function()? _initializeCamera;
  final void Function()? _refreshCamera;
  final bool _hasCamera;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!_hasCamera)
          FilledButton(
            onPressed: _initializeCamera,
            child: const Text(kInitializeCamera),
          ),
        if (!_hasCamera) const Gap(8),
        FilledButton(
          onPressed: _refreshCamera,
          child: const Text("$kRefreshBtn Camera"),
        ),
      ],
    );
  }
}
