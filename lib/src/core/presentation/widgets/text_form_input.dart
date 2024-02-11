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
    this.idNumber = false,
    this.phoneNumber = false,
    this.suffix,
  });

  final String _label;
  final TextEditingController _controller;
  final int? maxLines;
  final int? maxLength;
  final bool booleanFilter;
  final bool isTemperature;
  final bool idNumber;
  final bool phoneNumber;
  final Widget? suffix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booleanFormat = FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'));
    final temperatureFormat =
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}(\.\d{0,1})?'));
    final idFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]'));
    final phoneFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\+]'));

    return InfoLabel(
      label: _label,
      child: TextFormBox(
        controller: _controller,
        minLines: 1,
        maxLines: maxLines,
        maxLength: phoneNumber ? 11 : maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        suffix: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: suffix,
        ),
        inputFormatters: [
          if (booleanFilter) booleanFormat,
          if (isTemperature) temperatureFormat,
          if (isTemperature) TemperatureFormatter(),
          if (idNumber) idFilter,
          if (phoneNumber) phoneFilter,
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "The field ${_label.toLowerCase()} is required";
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
