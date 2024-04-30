import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:otoscopia/application.dart';
import 'package:otoscopia/src/core/core.dart';

Future<void> whatsNew(BuildContext context) async {
  await showDialog(
    barrierDismissible: true,
    dismissWithEsc: true,
    context: context,
    builder: (context) {
      return ContentDialog(
        constraints: const BoxConstraints(maxWidth: 1000),
        content: FutureBuilder(
          future: ApplicationConfig().fetchReleases(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            }

            final List<ReleaseEntity> releases =
                snapshot.data as List<ReleaseEntity>;

            return ListView(
              shrinkWrap: true,
              children: [
                const ListTile(
                  title: Text("What's New"),
                  subtitle: Text("Latest updates and features"),
                ),
                ...releases.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final release = entry.value;
                  return ListTile(
                    contentAlignment: CrossAxisAlignment.start,
                    trailing: IgnorePointer(
                      child: FilledButton(
                        child: Text(index == 0 ? "New" : "Old"),
                        onPressed: () {},
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(release.title),
                      ],
                    ),
                    subtitle: Markdown(data: release.body, shrinkWrap: true),
                  );
                })
              ],
            );
          },
        ),
        actions: [
          Button(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
