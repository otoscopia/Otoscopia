import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/features/settings/settings.dart';

class CustomText extends ConsumerWidget {
  const CustomText(this._text, {super.key, this.style = 7});

  final String _text;

  /// 1: title, 2: subtitle, 3: caption, 4: body Large, 5: body Strong, 6: bold caption
  final int style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = FluentTheme.of(context);
    final fontScale = ref.watch(fontSizeProvider);
    final fontSize = 0.5 + fontScale;
    switch (style) {
      case 1:
        return Text(
          _text,
          style: theme.typography.title,
          textScaler: TextScaler.linear(fontSize),
        );
      case 2:
        return Text(
          _text,
          style: theme.typography.subtitle,
          textScaler: TextScaler.linear(fontSize),
        );
      case 3:
        return Text(
          _text,
          style: theme.typography.caption,
          textScaler: TextScaler.linear(fontSize),
        );
      case 4:
        return Text(
          _text,
          style: theme.typography.bodyLarge,
          textScaler: TextScaler.linear(fontSize),
        );
      case 5:
        return Text(
          _text,
          style: theme.typography.bodyStrong,
          textScaler: TextScaler.linear(fontSize),
        );
      case 6:
        return Text(
          _text,
          style: theme.typography.caption?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textScaler: TextScaler.linear(fontSize),
        );
      default:
        return Text(
          _text,
          style: theme.typography.body,
          textScaler: TextScaler.linear(fontSize),
        );
    }
  }
}
