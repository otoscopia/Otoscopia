import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/guest/guest.dart';

class FetchDataUseCase {
  final FetchDataRepository _fetchDataRepository;

  FetchDataUseCase(this._fetchDataRepository);

  Future<List<AssignmentEntity>> getAssignments(UserEntity user) async {
    return await _fetchDataRepository.getAssignments(user);
  }

  Future<List<PatientEntity>> getPatients() async {
    return await _fetchDataRepository.getPatients();
  }

  Future<List<UsersEntity>> getDoctors() async {
    return await _fetchDataRepository.getDoctors();
  }

  Future<List<UsersEntity>> getNurses() async {
    return await _fetchDataRepository.getNurses();
  }

  Future<List<SchoolEntity>> getSchools() async {
    return await _fetchDataRepository.getSchools();
  }

  Future<List<ScreeningEntity>> getScreenings() async {
    return await _fetchDataRepository.getScreenings();
  }
}