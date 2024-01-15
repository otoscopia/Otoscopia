import 'package:flutter/services.dart';

import 'package:fluent_ui/fluent_ui.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm(
    this.label, {
    super.key,
    this.idNumber = false,
    this.phoneNumber = false,
    required this.controller,
  });

  final TextEditingController controller;
  final String label;
  final bool idNumber;
  final bool phoneNumber;

  @override
  Widget build(BuildContext context) {
    final idFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]'));
    final phoneFilter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\+]'));
    final int? maxLength = idNumber ? 20 : phoneNumber ? 11 : null;

    return SizedBox(
      width: 295,
      child: InfoLabel(
        label: label,
        child: TextBox(
          maxLength: maxLength,
          controller: controller,
          keyboardType: idNumber ? TextInputType.number : null,
          inputFormatters: [
            if (idNumber) idFilter,
            if (phoneNumber) phoneFilter,
          ],
        ),
      ),
    );
  }
}
