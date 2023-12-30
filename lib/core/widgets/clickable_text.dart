import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/link.dart';

class ClickableText extends ConsumerWidget {
  const ClickableText(this.text, {super.key, required this.uri});
  final String text;
  final String uri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Link(
      uri: Uri.parse(uri),
      builder: (context, open) {
        return HyperlinkButton(
          onPressed: open,
          child: Semantics(
            link: true,
            child: Text(text),
          ),
        );
      },
    );
  }
}
