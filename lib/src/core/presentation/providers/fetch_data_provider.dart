import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class FetchDataNotifier extends StateNotifier<void> {
  StateNotifierProviderRef<FetchDataNotifier, void> ref;
  FetchDataNotifier(this.ref) : super(null);
  static final FetchDataDataSource _source = FetchDataDataSource();
  final FetchDataRepository _repository = FetchDataRepositoryImpl(_source);

  Future<void> getAssignments() async {
    try {
      final result = await _repository.getAssignments();
      ref.read(assignmentsProvider.notifier).setAssignments(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getPatients() async {
    try {
      final result = await _repository.getPatients();
      ref.read(patientsProvider.notifier).setPatients(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getDoctors() async {
    try {
      final result = await _repository.getDoctors();
      ref.read(doctorsProvider.notifier).setDoctors(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getNurses() async {
    try {
      final result = await _repository.getNurses();
      ref.read(nursesProvider.notifier).setNurses(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getSchools() async {
    try {
      final result = await _repository.getSchools();
      ref.read(schoolsProvider.notifier).setSchools(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getScreenings() async {
    try {
      final result = await _repository.getScreenings();
      ref.read(screeningsProvider.notifier).setScreenings(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> fetch() async {
    await getAssignments();
    await getPatients();
    await getDoctors();
    await getNurses();
    await getSchools();
    await getScreenings();
  }
}

final fetchDataProvider = StateNotifierProvider<FetchDataNotifier, void>(
  (ref) => FetchDataNotifier(ref),
);
