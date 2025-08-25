import 'package:social_media_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<String> register({required UserEntity user});
}
