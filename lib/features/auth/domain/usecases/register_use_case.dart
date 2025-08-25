import 'package:social_media_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});
  Future<String> call(
      {required String email,
      required String username,
      required String password}) async {
    final user = UserEntity(
      email: email,
      username: username,
      password: password,
    );

    // UserModel(); //DTOs

    final token = await authRepository.register(user: user);

    return 'token'; // reposioty.register(user)
  }
}
