import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class YesNoRadio extends ConsumerStatefulWidget {
  const YesNoRadio(
    this._label,
    this._index, {
    super.key,
    required this.onChanged,
  });

  final String _label;
  final int _index;
  final ValueChanged<int> onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YesNoRadioState();
}

class _YesNoRadioState extends ConsumerState<YesNoRadio> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      label: widget._label,
      child: Row(
        children: List.generate(
          2,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RadioButton(
                  checked: value == index,
                  content: Text(yesNo[index]),
                  onChanged: (changed) {
                    if (changed) {
                      setState(() => value = index);
                      widget.onChanged(index);
                    }
                  }),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    value = widget._index;
    super.initState();
  }
}
