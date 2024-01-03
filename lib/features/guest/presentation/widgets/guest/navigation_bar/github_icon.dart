import 'package:fluent_ui/fluent_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/link.dart';

import 'package:otoscopia/core/core.dart';

class GithubIcon extends StatelessWidget {
  const GithubIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: kGithub,
      target: LinkTarget.blank,
      builder: (context, followLink) {
        return IconButton(
          style: ButtonStyle(
            foregroundColor: ButtonState.resolveWith((states) {
              if (states.isHovering) return FluentTheme.of(context).accentColor;
              return FluentTheme.of(context).typography.body!.color;
            }),
          ),
          onPressed: followLink,
          icon: const Icon(Ionicons.logo_github, size: 18),
        );
      },
    );
  }
}
