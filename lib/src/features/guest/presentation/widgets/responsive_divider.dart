import 'package:fluent_ui/fluent_ui.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveDivider extends StatelessWidget {
  const ResponsiveDivider({super.key});

  @override
  Widget build(BuildContext context) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 650;

    return Divider(
      size: responsive ? 24 : 300,
      direction: responsive ? Axis.vertical : Axis.horizontal,
    );
  }
}
