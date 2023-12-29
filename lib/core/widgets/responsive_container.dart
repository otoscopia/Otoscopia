import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveContainer extends ConsumerWidget {
  const ResponsiveContainer({
    super.key,
    required this.children,
    this.layout = ResponsiveRowColumnType.COLUMN,
  });

  final List<ResponsiveRowColumnItem> children;
  final ResponsiveRowColumnType? layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveRowColumn(
      columnPadding: const EdgeInsets.all(16),
      rowSpacing: 16,
      columnSpacing: 16,
      columnMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.center,
      layout: layout!,
      children: children,
    );
  }
}
