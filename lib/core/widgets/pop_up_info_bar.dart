import 'package:fluent_ui/fluent_ui.dart';

Future<void> popUpInfoBar(
  String title,
  String message,
  BuildContext context, {
  int? seconds = 5,
  InfoBarSeverity? barSeverity = InfoBarSeverity.error,
}) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) {
      displayInfoBar(
        context,
        duration: Duration(seconds: seconds!),
        builder: (context, close) {
          return InfoBar(
            title: Text(title),
            content: Text(message),
            severity: barSeverity!,
            action: IconButton(
              icon: const Icon(FluentIcons.clear),
              onPressed: close,
            ),
          );
        },
      );
    },
  );

  return Future.value();
}
