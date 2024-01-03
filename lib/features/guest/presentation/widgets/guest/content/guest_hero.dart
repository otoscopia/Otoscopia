import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:otoscopia/core/core.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 1180;
    ResponsiveRowColumnType layout = responsive
        ? ResponsiveRowColumnType.ROW
        : ResponsiveRowColumnType.COLUMN;

    return ResponsiveRowColumn(
      layout: layout,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
      columnVerticalDirection: VerticalDirection.up,
      columnSpacing: 16,
      children: [
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: 570,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: !responsive
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const DisplayText(kAppName, primary: true),
                DisplayText(kMultiPlatform, center: !responsive),
                const Gap(8),
                TitleText(kDiscoverYourEarHealth,
                    center: !responsive, withOpacity: true),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Container(
            width: 570,
            color: Colors.blue,
            height: 570,
          ),
        ),
      ],
    );
  }
}
