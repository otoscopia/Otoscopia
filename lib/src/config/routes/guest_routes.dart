import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';
import 'package:otoscopia/src/features/guest/guest.dart';

class GuestRoutes extends NamedGuest {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      NamedGuest.about: (context) => const About(),
      NamedGuest.docs: (context) => const Docs(),
      NamedGuest.faq: (context) => const About(),
      NamedGuest.home: (context) => const SignIn(),
      NamedGuest.login: (context) => const SignIn(),
      NamedGuest.news: (context) => const News(),
      NamedGuest.privacyPolicy: (context) => const About(),
      NamedGuest.register: (context) => const SignUp(),
      NamedGuest.forgotPassword: (context) => const ForgotPassword(),
      NamedGuest.termsAndConditions: (context) => const About(),
    };
  }
}
