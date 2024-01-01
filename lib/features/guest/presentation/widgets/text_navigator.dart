import 'package:fluent_ui/fluent_ui.dart';

class TextNavigator extends StatelessWidget {
  const TextNavigator(
    this.text, {
    super.key,
    required this.child,
  });
  final String text;
  final String child;

  @override
  Widget build(BuildContext context) {
    return HyperlinkButton(
      style: ButtonStyle(
        foregroundColor: ButtonState.resolveWith((states) {
          if (states.isHovering) return FluentTheme.of(context).accentColor;
          return FluentTheme.of(context).typography.body!.color;
        }),
      ),
      child: Text(text),
      onPressed: () => Navigator.pushNamed(context, child),
    );
  }
}
