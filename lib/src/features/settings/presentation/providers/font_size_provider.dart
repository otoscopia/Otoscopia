import 'package:flutter_riverpod/flutter_riverpod.dart';

class FontSizeNotifier extends StateNotifier<double> {
  FontSizeNotifier() : super(0.0);

  void changeFontSize(double value) => state = value;
}

final fontSizeProvider = StateNotifierProvider<FontSizeNotifier, double>((ref) {
  return FontSizeNotifier();
});
