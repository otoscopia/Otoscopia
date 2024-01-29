import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/guest/guest.dart';

class FetchDataNotifier extends StateNotifier<void> {
  StateNotifierProviderRef<FetchDataNotifier, void> ref;
  FetchDataNotifier(this.ref) : super(null);
  static final FetchDataDataSource _source = FetchDataDataSource();
  final FetchDataRepository _repository = FetchDataRepositoryImpl(_source);

  Future<void> getAssignments(UserEntity user) async {
    try {
      final result = await _repository.getAssignments(user);
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

  Future<void> getSchools(UserEntity user) async {
    List<SchoolEntity> schools;
    try {
      final result = await _repository.getSchools();

      if (user.role == UserRole.nurse) {
        final assignments = ref.read(assignmentsProvider);

        schools = result.where((school) {
          return assignments.where((assignment) {
            return assignment.school == school.id;
          }).isNotEmpty;
        }).toList();
      } else {
        schools = result;
      }

      ref.read(schoolsProvider.notifier).setSchools(schools);
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

  Future<void> setTableData() async {
    final patients = ref.read(patientsProvider);
    final screenings = ref.read(screeningsProvider);
    ref.read(tableProvider.notifier).setTable(patients, screenings);
  }

  Future<void> fetch(UserEntity user) async {
    await getAssignments(user);
    await getPatients();
    await getDoctors();
    await getNurses();
    await getSchools(user);
    await getScreenings();
    await setTableData();
  }
}

final fetchDataProvider = StateNotifierProvider<FetchDataNotifier, void>(
  (ref) => FetchDataNotifier(ref),
);
