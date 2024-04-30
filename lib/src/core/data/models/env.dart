import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APPWRITE_ENDPOINT', obfuscate: true)
  static final String endpoint = _Env.endpoint;

  @EnviedField(varName: 'APPWRITE_PROJECT', obfuscate: true)
  static final String project = _Env.project;

  @EnviedField(varName: 'DATABASE', obfuscate: true)
  static final String database = _Env.database;

  @EnviedField(varName: 'ACCOUNT_CREATION_ID', obfuscate: true)
  static final String accountCreation = _Env.accountCreation;

  @EnviedField(varName: 'MESSAGING_ID', obfuscate: true)
  static final String messaging = _Env.messaging;

  @EnviedField(varName: 'SCREENING_BUCKET', obfuscate: true)
  static final String screeningBucket = _Env.screeningBucket;

  @EnviedField(varName: 'AVATAR_BUCKET', obfuscate: true)
  static final String avatarBucket = _Env.avatarBucket;

  @EnviedField(varName: 'PRESCRIPTIONS_BUCKET', obfuscate: true)
  static final String prescriptionsBucket = _Env.prescriptionsBucket;

  @EnviedField(varName: 'ASSIGNMENT_COLLECTION', obfuscate: true)
  static final String assignmentCollection = _Env.assignmentCollection;

  @EnviedField(varName: 'PATIENT_COLLECTION', obfuscate: true)
  static final String patientCollection = _Env.patientCollection;

  @EnviedField(varName: 'REMARKS_COLLECTION', obfuscate: true)
  static final String remarksCollection = _Env.remarksCollection;

  @EnviedField(varName: 'SCHOOL_COLLECTION', obfuscate: true)
  static final String schoolCollection = _Env.schoolCollection;

  @EnviedField(varName: 'SCREENING_COLLECTION', obfuscate: true)
  static final String screeningCollection = _Env.screeningCollection;

  @EnviedField(varName: 'USER_COLLECTION', obfuscate: true)
  static final String userCollection = _Env.userCollection;

  @EnviedField(varName: 'SENTRY_API', obfuscate: true)
  static final String sentryApi = _Env.sentryApi;
}
