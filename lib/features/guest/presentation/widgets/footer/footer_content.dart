import 'package:fluent_ui/fluent_ui.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:otoscopia/core/core.dart';

import '../responsive_divider.dart';

class FooterContent extends StatelessWidget {
  const FooterContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 650;
    ResponsiveRowColumnType layout = responsive
        ? ResponsiveRowColumnType.ROW
        : ResponsiveRowColumnType.COLUMN;

    return ResponsiveRowColumn(
      layout: layout,
      columnSpacing: 8,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        ResponsiveRowColumnItem(
            child: ClickableText(kLicensed, uri: kLicensedUri)),
        ResponsiveRowColumnItem(child: ResponsiveDivider()),
        ResponsiveRowColumnItem(
          child: ClickableText(
            kPrivacyPolicy,
            uri: kPrivacyPolicyUri,
          ),
        ),
        ResponsiveRowColumnItem(child: ResponsiveDivider()),
        ResponsiveRowColumnItem(
          child: ClickableText(kPoweredBy, uri: kPoweredByUri),
        ),
      ],
    );
  }
}
