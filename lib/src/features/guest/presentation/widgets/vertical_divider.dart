import 'package:fluent_ui/fluent_ui.dart';

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(size: 20, direction: Axis.vertical);
  }
}
