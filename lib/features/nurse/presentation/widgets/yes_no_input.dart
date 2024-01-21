import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/features/nurse/nurse.dart';

class YesNoRadioInput extends ConsumerStatefulWidget {
  const YesNoRadioInput({
    super.key,
    required this.radioLabel,
    required this.value,
    required this.inputLabel,
    required this.controller,
    required this.onChanged,
  });

  final String radioLabel;
  final String inputLabel;
  final TextEditingController controller;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _YesNoRadioInputState();
}

class _YesNoRadioInputState extends ConsumerState<YesNoRadioInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YesNoRadio(
          widget.radioLabel,
          widget.value,
          onChanged: widget.onChanged,
        ),
        if (widget.value == 0) const Gap(16),
        if (widget.value == 0)
          TextFormInput(
            widget.inputLabel,
            widget.controller,
            maxLines: 5,
          ),
      ],
    );
  }
}
