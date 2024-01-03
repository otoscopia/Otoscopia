import 'package:fluent_ui/fluent_ui.dart';

import 'guest_hero.dart';


class GuestContent extends StatelessWidget {
  const GuestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: ListView(
            shrinkWrap: true,
            children: const [
              HeroSection(),
            ],
          ),
        ),
      ),
    );
  }
}
