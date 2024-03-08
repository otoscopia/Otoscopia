import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionNotifier extends StateNotifier<bool> {
  ConnectionNotifier() : super(false);

  void setConnection(bool value) {
    state = value;
  }
}

final connectionProvider =
    StateNotifierProvider<ConnectionNotifier, bool>((ref) {
  return ConnectionNotifier();
});
