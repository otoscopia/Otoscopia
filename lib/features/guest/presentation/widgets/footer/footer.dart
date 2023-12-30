import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:otoscopia/core/core.dart';

import "footer_content.dart";

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool responsive = ResponsiveBreakpoints.of(context).screenWidth > 650;
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnSpacing: responsive ? 4 : 8,
      children: [
        const ResponsiveRowColumnItem(child: FooterContent()),
        ResponsiveRowColumnItem(
          child: const Text(kCopyRight).textAlignment(TextAlign.center),
        )
      ],
    );
  }
}
