import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class FetchDataNotifier extends StateNotifier<void> {
  StateNotifierProviderRef<FetchDataNotifier, void> ref;
  FetchDataNotifier(this.ref) : super(null);
  static final FetchDataDataSource _source = FetchDataDataSource();
  static final FetchImageDataSource _imageSource = FetchImageDataSource();
  final FetchDataRepository _repository = FetchDataRepositoryImpl(_source);
  final FetchImageRepository _imageRepository =
      FetchImageRepositoryImpl(_imageSource);

  Future<void> getSchools() async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getSchools();
        ref.read(schoolsProvider.notifier).setSchools(result);
      } else {
        final schoolBox = await Hive.openBox<SchoolModel>(kSchoolsHiveBox);
        final schoolsModel = schoolBox.values.toList();
        final schools =
            schoolsModel.map((e) => SchoolEntity.fromModel(e)).toList();
        ref.read(schoolsProvider.notifier).setSchools(schools);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getUnAssignedSchools() async {
    try {
      final result = await _repository.getUnAssignedSchools();
      ref.read(schoolsProvider.notifier).setSchools(result);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getAssignments() async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getAssignments();
        ref.read(assignmentsProvider.notifier).setAssignments(result);
      } else {
        final assignmentBox =
            await Hive.openBox<AssignmentModel>(kAssignmentsHiveBox);
        final assignmentModel = assignmentBox.values.toList();
        final assignments =
            assignmentModel.map((e) => AssignmentEntity.fromModel(e)).toList();
        ref.read(assignmentsProvider.notifier).setAssignments(assignments);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getAssignmentsByNurse(UserEntity user) async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getAssignmentsByNurse(user.id);
        ref.read(assignmentsProvider.notifier).setAssignments(result);
      } else {
        final assignmentBox =
            await Hive.openBox<AssignmentModel>(kAssignmentsHiveBox);
        final assignmentModel = assignmentBox.values.toList();
        final assignments =
            assignmentModel.map((e) => AssignmentEntity.fromModel(e)).toList();
        ref.read(assignmentsProvider.notifier).setAssignments(assignments);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getPatientsBySchools() async {
    final schools =
        ref.read(schoolsProvider).map((school) => school.id).toList();
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getPatientsBySchools(schools);
        ref.read(patientsProvider.notifier).setPatients(result);
      } else {
        final patientBox = await Hive.openBox<PatientModel>(kPatientHiveBox);
        final patientModel = patientBox.values.toList();
        final patients =
            patientModel.map((e) => PatientEntity.fromModel(e)).toList();
        ref.read(patientsProvider.notifier).setPatients(patients);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getPatientsByDoctor(String id) async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getPatientsByDoctor(id);
        ref.read(patientsProvider.notifier).setPatients(result);
      } else {
        final patientBox = await Hive.openBox<PatientModel>(kPatientHiveBox);
        final patientModel = patientBox.values.toList();
        final patients =
            patientModel.map((e) => PatientEntity.fromModel(e)).toList();
        ref.read(patientsProvider.notifier).setPatients(patients);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getDoctors() async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getDoctors();
        ref.read(doctorsProvider.notifier).setDoctors(result);
      } else {
        final doctorBox = await Hive.openBox<UsersModel>(kDoctorsHiveBox);
        final doctorModel = doctorBox.values.toList();
        final doctors =
            doctorModel.map((e) => UsersEntity.fromModel(e)).toList();
        ref.read(doctorsProvider.notifier).setDoctors(doctors);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getNurses() async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getNurses();
        ref.read(nursesProvider.notifier).setNurses(result);
      } else {
        final nurseBox = await Hive.openBox<UsersModel>(kNursesHiveBox);
        final nurseModel = nurseBox.values.toList();
        final nurses = nurseModel.map((e) => UsersEntity.fromModel(e)).toList();
        ref.read(nursesProvider.notifier).setNurses(nurses);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getScreeningsByPatient() async {
    final patients = ref.read(patientsProvider).map((e) => e.id).toList();
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getScreeningsByPatient(patients);
        ref.read(screeningsProvider.notifier).setScreenings(result);
      } else {
        final screeningBox =
            await Hive.openBox<ScreeningModel>(kScreeningHiveBox);
        final screeningModel = screeningBox.values.toList();
        final screenings =
            screeningModel.map((e) => ScreeningEntity.fromModel(e)).toList();
        ref.read(screeningsProvider.notifier).setScreenings(screenings);
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<ScreeningEntity> getScreeningsByPatientId(String id) async {
    try {
      if (ref.read(connectionProvider)) {
        final result = await _repository.getScreeningsByPatientId(id);
        return result;
      } else {
        final screeningBox =
            await Hive.openBox<ScreeningModel>(kScreeningHiveBox);
        final screeningModel = screeningBox.values
            .toList()
            .firstWhere((element) => element.patient == id);
        final screenings = ScreeningEntity.fromModel(screeningModel);
        return screenings;
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<RemarksEntity>> getRemarks(String screening) async {
    try {
      final result = await _repository.getRemarksByScreening(screening);
      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<Uint8List>> getImages(String path, List<String> ids) async {
    try {
      final result = await _imageRepository.getImages(path, ids);
      return result;
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

  Future<void> filterSchoolsByUser(UserEntity user) async {
    final schools = ref.read(schoolsProvider);
    final assignments = ref.read(assignmentsProvider);
    final filteredSchools = schools.where((school) {
      return assignments.where((assignment) {
        return assignment.school == school.id;
      }).isNotEmpty;
    }).toList();
    ref.read(schoolsProvider.notifier).setSchools(filteredSchools);
  }

  Future<void> fetch(UserEntity user) async {
    await getSchools();
    await getDoctors();
    await getNurses();

    if (user.role == UserRole.nurse) {
      await getAssignmentsByNurse(user);
      await filterSchoolsByUser(user);
      await getPatientsBySchools();
    } else {
      await getAssignments();
      await getPatientsByDoctor(user.id);
    }
    await getScreeningsByPatient();
    await setTableData();
  }
}

final fetchDataProvider = StateNotifierProvider<FetchDataNotifier, void>(
  (ref) => FetchDataNotifier(ref),
);
