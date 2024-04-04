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
            ref.read(appIndexProvider.notifier).setIndex(1);
            final patient = ref.read(patientsProvider.notifier).findByName(value.value!.name);
            ref.read(patientsTabProvider.notifier).addTab(patient!);
            break;
          case SearchRole.nurse:
            break;
          case SearchRole.doctor:
            break;
          case SearchRole.schools:
            ref.read(appIndexProvider.notifier).setIndex(2);
            final schools = ref.read(schoolsProvider.notifier).findByName(value.value!.name);
            ref.read(schoolsTabProvider.notifier).addTab(schools);
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
