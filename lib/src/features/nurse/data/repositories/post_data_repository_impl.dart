import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PostDataRepositoryImpl implements PostDataDataSource {
  final PostDataDataSource _source;

  PostDataRepositoryImpl(this._source);

  @override
  Future<void> postPatient(PatientEntity patient) async {
    try {
      return await _source.postPatient(patient);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> postScreening(ScreeningEntity screening) async {
    try {
      return await _source.postScreening(screening);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}
