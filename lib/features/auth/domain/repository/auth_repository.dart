import 'package:social_media_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_media_app/features/auth/domain/models/LoginParams.dart';

abstract class AuthRepository {
  Future<String> register({required UserEntity user});
  Future<String> login({required LoginParams loginParams});
}
