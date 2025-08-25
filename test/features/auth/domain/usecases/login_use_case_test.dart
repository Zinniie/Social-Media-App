import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/auth/data/repository/MockAuthRepository.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';

void main() {
  group('LoginUseCase test', () {
    late LoginUseCase loginUseCase;
    setUp(() {
      loginUseCase = LoginUseCase(authRepository: MockAuthRepository());
    });
    test('Should login user succesfully and return token', () async {
      final String email = 'ezinne@gmail.com';
      final String password = 'password123';

      final result = await loginUseCase.call(
        email: email,
        password: password,
      );
      expect(result, 'token');
    });

    test('Should return an error with empty mail', () async {
      final String email = 'ezinne';
      final String password = 'password123';

       expect(() async => await loginUseCase.call(
        email: email,
        password: password,
      ), throwsA(isA<Exception>()));
     
    });
  });
}
