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

    @EnviedField(varName: 'USER_COLLECTION', obfuscate: true)
    static final String userCollection = _Env.userCollection;
}