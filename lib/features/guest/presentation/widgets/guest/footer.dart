import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/guest/guest.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 650;
    ResponsiveRowColumnType layout = responsive
        ? ResponsiveRowColumnType.ROW
        : ResponsiveRowColumnType.COLUMN;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveRowColumn(
          layout: layout,
          columnSpacing: 8,
          rowSpacing: 8,
          rowMainAxisAlignment: MainAxisAlignment.center,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ResponsiveRowColumnItem(child: TextNavigator(kTermsAndConditionsBtn, child: NamedGuest.termsAndConditions)),
            ResponsiveRowColumnItem(child: ResponsiveDivider()),
            ResponsiveRowColumnItem(child: TextNavigator(kPrivacyPolicyBtn, child: NamedGuest.privacyPolicy)),
            ResponsiveRowColumnItem(child: ResponsiveDivider()),
            ResponsiveRowColumnItem(child: TextNavigator(kFAQBtn, child: NamedGuest.faq)),
          ],
        ),
        Gap(responsive ? 4 : 8),
        const Text(kCopyRight).textAlignment(TextAlign.center)
      ],
    );
  }
}
