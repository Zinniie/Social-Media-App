// ignore_for_file: prefer_const_declarations

import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';

import '../../data/repository/MockAuthRepository.dart';

void main() {
  group('RegisterUseCase test', () {
    late RegisterUseCase registerUseCase;
     late RegisterUseCase registerWithErrorUseCase;

    setUp(() {
      registerUseCase = RegisterUseCase(
          authRepository: MockAuthRepository() 
          );
           registerWithErrorUseCase = RegisterUseCase(
          authRepository: MockAuthWithErrorRepository() 
          );
    });
    test('Should register user successfully and return token', () async {
      final String email = "ezinne@test.com";
      final String username = "ezinne";
      final String password = "password123";

      final result = await registerUseCase.call(
        email: email,
        username: username,
        password: password,
      );

      expect(result, 'token');
    });

    test('Should return an error with empty email', () async {
      final String email = "";
      final String username = "ezinne";
      final String password = "password123";

      RegisterUseCase registerUseCase =
          RegisterUseCase(authRepository: MockAuthRepository());

      expect(
          () async => await registerUseCase.call(
                email: email,
                username: username,
                password: password,
              ),
          throwsA(isA<Exception>()));
    });

    test('Should return an error if email have wrong format', () async {
      final String email = "ezinne";
      final String username = "ezinne";
      final String password = "password123";

      expect(
          () async => await registerUseCase.call(
                email: email,
                username: username,
                password: password,
              ),
          throwsA(isA<Exception>()));
    });

    test(
        'Should return an error if password do not have at least 4 characters long',
        () async {
      final String email = "ezinne@test.com";
      final String username = "ezinne";
      final String password = "123";

   
      expect(
          () async => await registerUseCase.call(
                email: email,
                username: username,
                password: password,
              ),
          throwsA(isA<Exception>()));
    });

    test('Should return an error if username is empty', () async {
      final String email = "ezinne@test.com";
      final String username = "";
      final String password = "1234";

  
      expect(
          () async => await registerUseCase.call(
                email: email,
                username: username,
                password: password,
              ),
          throwsA(isA<Exception>()));
    });

     test('Should return an error if username is empty', () async {
      final String email = "ezinne@test.com";
      final String username = "ezinne";
      final String password = "1234";

      expect(
          () async => await registerWithErrorUseCase.call(
                email: email,
                username: username,
                password: password,
              ),
          throwsA(isA<Exception>()));
    });
  });
}
