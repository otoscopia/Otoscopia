import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as icons;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/application.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/settings/settings.dart';

List<NavigationPaneItem> footerItems(WidgetRef ref, BuildContext context) {
  final user = ref.watch(userProvider);
  final menuController = FlyoutController();

  return [
    PaneItemSeparator(),
    PaneItemAction(
      icon: const Icon(icons.FluentIcons.megaphone_loud_20_regular),
      title: const Text("Whats New"),
      onTap: () async {
        await showDialog(
          barrierDismissible: true,
          dismissWithEsc: true,
          context: context,
          builder: (context) {
            return ContentDialog(
              constraints: const BoxConstraints(maxWidth: 700),
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

                  final List<ReleaseEntity> releases = snapshot.data as List<ReleaseEntity>;

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
                          subtitle:
                              Markdown(data: release.body, shrinkWrap: true),
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
      },
    ),
    PaneItem(
      icon: const Icon(icons.FluentIcons.settings_20_regular),
      title: const Text(kSettings),
      body: const Settings(),
    ),
    PaneItemAction(
      icon: FlyoutTarget(
        controller: menuController,
        child: Container(
          width: 18.0,
          height: 18.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(user.image!),
            ),
          ),
        ),
      ),
      title: const Text(kProfile),
      onTap: () {
        menuController.showFlyout(
          barrierDismissible: true,
          dismissWithEsc: true,
          builder: (context) {
            return MenuFlyout(
              items: [
                MenuFlyoutItem(
                  leading: const Icon(FluentIcons.account_management),
                  text: const Text('Manage Account'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      FluentPageRoute(builder: (context) => const Profile()),
                    );
                  },
                ),
                MenuFlyoutItem(
                  leading: const Icon(FluentIcons.sign_out),
                  text: const Text('Sign Out'),
                  onPressed: Flyout.of(context).close,
                ),
              ],
            );
          },
        );
      },
    ),
    PaneItemSeparator(),
  ];
}

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
