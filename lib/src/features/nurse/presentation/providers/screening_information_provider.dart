import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class ScreeningInformationNotifier extends StateNotifier<ScreeningEntity> {
  ScreeningInformationNotifier() : super(ScreeningEntity.initial());

  void setScreening(WidgetRef ref, MedicalFormEntity medical) {
    final patient = ref.read(patientProvider);
    state = ScreeningEntity.fromMedical(medical, patient.id, state.images);
  }

  void setImage(String image) {
    state = state.copyWith(images: [...state.images, image]);
  }

  Future<void> removeImage(String image) async {
    final earPosition = image.split("\\").last.toLowerCase().contains("left")
        ? "left"
        : "right";
    final imagePosition = state.images
        .where((element) => element.toLowerCase().contains(earPosition))
        .toList();

    final length = imagePosition.length;

    if (length == 1) {
      throw Exception("You can't remove the last image");
    }

    File file = File(image);
    try {
      await file.delete();
      state = state.copyWith(images: state.images..remove(image));
    } catch (e) {
      throw Exception("Error deleting the image");
    }
  }

  void resetInformation() => state = ScreeningEntity.initial();
}

final screeningInformationProvider =
    StateNotifierProvider<ScreeningInformationNotifier, ScreeningEntity>((ref) {
  return ScreeningInformationNotifier();
});
