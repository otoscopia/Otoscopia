import 'package:fluent_ui/fluent_ui.dart';

Future<void> popUpInfoBar(
  String title,
  String message,
  BuildContext context, {
  int? seconds = 5,
  InfoBarSeverity? barSeverity = InfoBarSeverity.error,
}) {
  displayInfoBar(
    context,
    duration: Duration(seconds: seconds!),
    builder: (context, close) {
      return InfoBar(
        title: Text(title),
        content: Text(message),
        severity: barSeverity!,
        isLong: true,
        onClose: close,
      );
    },
  );

  return Future.value();
}
