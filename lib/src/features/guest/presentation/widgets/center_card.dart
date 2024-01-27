import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CenterCard extends ConsumerWidget {
  const CenterCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Card(padding: const EdgeInsets.all(44), child: child));
  }
}
