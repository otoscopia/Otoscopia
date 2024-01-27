import 'package:fluent_ui/fluent_ui.dart';
import 'package:styled_widget/styled_widget.dart';

class TextNavigator extends StatelessWidget {
  const TextNavigator(
    this.text, {
    super.key,
    this.child,
    this.bold = true,
    this.pop = false,
  });

  final String text;
  final String? child;
  final bool bold;
  final bool pop;

  @override
  Widget build(BuildContext context) {
    return HyperlinkButton(
      style: ButtonStyle(
        foregroundColor: ButtonState.resolveWith((states) {
          if (states.isHovering) return FluentTheme.of(context).accentColor;
          return FluentTheme.of(context).typography.body!.color;
        }),
      ),
      child: Text(text).fontWeight(bold ? null : FontWeight.normal),
      onPressed: () => pop ? Navigator.pop(context) : Navigator.pushNamed(context, child!),
    );
  }
}
