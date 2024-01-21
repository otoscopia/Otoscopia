import 'package:flutter/services.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFormInput extends ConsumerWidget {
  const TextFormInput(
    this._label,
    this._controller, {
    super.key,
    this.maxLines = 1,
    this.booleanFilter = false,
    this.isTemperature = false,
    this.maxLength,
  });

  final String _label;
  final TextEditingController _controller;
  final int? maxLines;
  final int? maxLength;
  final bool booleanFilter;
  final bool isTemperature;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booleanFormat = FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'));
    final temperatureFormat =
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}(\.\d{0,1})?'));
    return InfoLabel(
      label: _label,
      child: TextFormBox(
        controller: _controller,
        minLines: 1,
        maxLines: maxLines,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          if (booleanFilter) booleanFormat,
          if (isTemperature) temperatureFormat,
          if (isTemperature) TemperatureFormatter(),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "The field $_label is required";
          }
          return null;
        },
      ),
    );
  }
}

class TemperatureFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = newValue.text;
    final buffer = StringBuffer();

    for (var i = 0; i < newString.length; i++) {
      if (i == 2 && !newString.contains('.')) {
        buffer.write('.');
      }
      buffer.write(newString[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
