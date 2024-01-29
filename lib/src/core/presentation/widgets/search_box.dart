import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class SearchBox extends ConsumerStatefulWidget {
  const SearchBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState extends ConsumerState<SearchBox> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<SearchEntity> list = ref.watch(searchProvider);
    final List<AutoSuggestBoxItem<SearchEntity>> items = list
        .map((item) => AutoSuggestBoxItem(value: item, label: item.name))
        .toList();

    return AutoSuggestBox<SearchEntity>(
      items: items,
      placeholder: kSearch,
      controller: _controller,
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
