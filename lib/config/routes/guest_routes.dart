import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

class GuestRoutes extends GuestNamedRoutes {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    return {
      GuestNamedRoutes.about: (context) => const About("about"),
      GuestNamedRoutes.docs: (context) => const Docs(),
      GuestNamedRoutes.faq: (context) => const About("faq"),
      GuestNamedRoutes.home: (context) => const Guest(),
      GuestNamedRoutes.login: (context) => const SignIn(),
      GuestNamedRoutes.news: (context) => const News(),
      GuestNamedRoutes.privacyPolicy: (context) => const About("privacy_policy"),
      GuestNamedRoutes.register: (context) => const SignUp(),
      GuestNamedRoutes.termsAndConditions: (context) => const About("terms_and_conditions"),
    };
  }
}
