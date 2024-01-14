import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

class GuestRoutes extends NamedGuest {
  static Map<String, WidgetBuilder> getRoutes(DeviceType deviceType) {
    final bool isDesktop = deviceType == DeviceType.desktop;
    final bool isMobile = deviceType == DeviceType.mobile;
    return {
      NamedGuest.about: (context) => const About(),
      NamedGuest.docs: (context) => const Docs(),
      NamedGuest.faq: (context) => const About(),
      NamedGuest.home: (context) => isDesktop || isMobile ? const SignIn() : const Guest(),
      NamedGuest.login: (context) => const SignIn(),
      NamedGuest.news: (context) => const News(),
      NamedGuest.privacyPolicy: (context) => const About(),
      NamedGuest.register: (context) => const SignUp(),
      NamedGuest.forgotPassword: (context) => const ForgotPassword(),
      NamedGuest.termsAndConditions: (context) => const About(),
    };
  }
}
