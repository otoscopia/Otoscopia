import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

import 'github_icon.dart';
import 'theme_mode_icon.dart';

class NavigationContent extends StatelessWidget {
  const NavigationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TextNavigator(kSignIn, child: GuestNamedRoutes.login),
        Gap(8),
        VerticalDivider(),
        Gap(8),
        TextNavigator(kDocs, child: GuestNamedRoutes.docs),
        Gap(8),
        TextNavigator(kNews, child: GuestNamedRoutes.news),
        Gap(8),
        VerticalDivider(),
        Gap(8),
        ThemeModeIcon(),
        Gap(8),
        VerticalDivider(),
        Gap(8),
        GithubIcon(),
      ],
    );
  }
}
