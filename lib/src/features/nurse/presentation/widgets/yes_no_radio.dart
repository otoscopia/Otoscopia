import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class YesNoRadio extends ConsumerStatefulWidget {
  const YesNoRadio(
    this._label,
    this._index, {
    super.key,
    required this.onChanged,
    this.content = yesNo,
    this.mainAxisAlignment,
  });

  final String _label;
  final int _index;
  final List<String> content;
  final ValueChanged<int> onChanged;
  final MainAxisAlignment? mainAxisAlignment;

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
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        children: List.generate(
          2,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RadioButton(
                  checked: value == index,
                  content: Text(widget.content[index]),
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
