import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class SearchBox extends ConsumerWidget {
  const SearchBox({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SearchEntity> list = ref.watch(searchProvider);
    final List<AutoSuggestBoxItem<SearchEntity>> items = list
        .map((item) => AutoSuggestBoxItem(value: item, label: item.name))
        .toList();

    return AutoSuggestBox<SearchEntity>(
      items: items,
      placeholder: kSearch,
      controller: controller,
      onSelected: (value) {
        switch (value.value!.role) {
          case SearchRole.patient:
            break;
          case SearchRole.nurse:
            break;
          case SearchRole.doctor:
            break;
          case SearchRole.schools:
            break;
          case SearchRole.settings:
            break;
          default:
            //* default is profile.
            break;
        }
      },
      trailingIcon: IgnorePointer(
        child: IconButton(
          icon: const Icon(FluentIcons.search),
          onPressed: () {},
        ),
      ),
    );
  }
}
