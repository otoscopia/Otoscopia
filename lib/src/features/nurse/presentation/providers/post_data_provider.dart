import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PostDataNotifier extends StateNotifier<void> {
  final StateNotifierProviderRef<PostDataNotifier, void> ref;
  PostDataNotifier(this.ref) : super(null);
  static final _source = PostDataDataSource();
  static final _repository = PostDataRepositoryImpl(_source);

  Future<bool> postPatient(PatientEntity patient) async {
    try {
      await _repository.postPatient(patient);
      return true;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<bool> postScreening(ScreeningEntity screening) async {
    try {
      await _repository.postScreening(screening);
      return true;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}

final postDataProvider = StateNotifierProvider<PostDataNotifier, void>((ref) {
  return PostDataNotifier(ref);
});
