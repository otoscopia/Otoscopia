import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class SearchNotifier extends StateNotifier<List<SearchEntity>> {
  SearchNotifier() : super([]);

  void addList(List<SearchEntity> list) => state = list;
}

final searchProvider =
    StateNotifierProvider<SearchNotifier, List<SearchEntity>>(
  (ref) => SearchNotifier(),
);
