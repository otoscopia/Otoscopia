import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class SearchBox extends ConsumerWidget {
  const SearchBox({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoSuggestBox(
      controller: controller,
      placeholder: kSearch,
      trailingIcon: IgnorePointer(
        child: IconButton(
          icon: const Icon(FluentIcons.search),
          onPressed: () {},
        ),
      ),
      items: const [],
    );
  }
}
