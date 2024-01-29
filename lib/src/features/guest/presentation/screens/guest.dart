import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/guest/guest.dart';

class Guest extends StatelessWidget {
  const Guest({super.key});

  @override
  Widget build(BuildContext context) {
    return const ApplicationContainer(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [NavigationBar(), GuestContent(), Footer()],
        ),
      ),
    );
  }
}
