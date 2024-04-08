import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/config/themes/colors.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(
    this.text, {
    super.key,
    this.primary = false,
    this.center = false,
  });

  final bool? primary;
  final String text;
  final bool? center;

  @override
  Widget build(BuildContext context) {
    final color = AppColors();
    return Text(
      text,
      style: TextStyle(
        fontSize: 56,
        color: primary! ? color.systemAccent : null,
        fontWeight: FontWeight.bold,
      ),
      textAlign: center! ? TextAlign.center : TextAlign.start,
    );
  }
}
