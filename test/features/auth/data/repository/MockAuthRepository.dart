import 'package:social_media_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_media_app/features/auth/domain/models/LoginParams.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<String> register({required UserEntity user}) async{
    return 'token';
  }

  @override
  Future<String> login({required LoginParams loginParams}) async{
    return 'token';
  }
}

class MockAuthWithErrorRepository implements AuthRepository {
  @override
  Future<String> register({required UserEntity user}) async {

    throw Exception('Registration failed');
  }
  
  @override
  Future<String> login({required LoginParams loginParams}) async {
  
       throw Exception('Login failed');
  }
}
