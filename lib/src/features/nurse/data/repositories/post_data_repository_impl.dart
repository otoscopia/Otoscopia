import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PostDataRepositoryImpl implements PostDataDataSource {
  final PostDataDataSource _source;

  PostDataRepositoryImpl(this._source);

  @override
  Future<void> postPatient(bool connection, PatientEntity patient) async {
    try {
      return await _source.postPatient(connection, patient);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> postScreening(bool connection, ScreeningEntity screening) async {
    try {
      return await _source.postScreening(connection, screening);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}
