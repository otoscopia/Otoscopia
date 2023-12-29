import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveContainer extends ConsumerWidget {
  const ResponsiveContainer({super.key, required this.children});
  final List<ResponsiveRowColumnItem> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    ResponsiveRowColumnType layout = isDesktop
        ? ResponsiveRowColumnType.ROW
        : ResponsiveRowColumnType.COLUMN;

    return ResponsiveRowColumn(
      columnMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.center,
      layout: layout,
      children: children,
    );
  }
}
