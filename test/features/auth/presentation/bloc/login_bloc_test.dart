import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/auth/data/repository/MockAuthRepository.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:social_media_app/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:social_media_app/features/auth/presentation/login/bloc/login_event.dart';
import 'package:social_media_app/features/auth/presentation/login/bloc/login_state.dart';

import '../../domain/services/mock_user_session_service.dart';

void main() {
  group('LoginBloc test', () {
    late LoginBloc loginBloc;
    late LoginBloc loginBlocWithRepositoryError;
     MockUserSessionService mockUserSessionService = MockUserSessionService();

    setUp(() {
      loginBloc = LoginBloc(
        loginUseCase: LoginUseCase(
          authRepository: MockAuthRepository(),
        ),
        userSessionService: mockUserSessionService,
      );
      loginBlocWithRepositoryError = LoginBloc(
        loginUseCase: LoginUseCase(
          authRepository: MockAuthWithErrorRepository(),
        ),
        userSessionService: mockUserSessionService,
      );
    });

    blocTest(
      'emit [LoginLoading, LoginSuccess] when login is successful',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted(
        email: 'ezinne@gmail.com',
        password: '1234',
      )),
      expect: () => [
        LoginLoading(),
        LoginSuccess(),
      ],
    );

    blocTest(
      'emit [LoginLoading, LoginFailure] when paswword is wrong',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginSubmitted(
        email: 'ezinne@gmail.com',
        password: '0',
      )),
      expect: () => [
        LoginLoading(),
        isA<LoginFailure>(),
      ],
    );

    blocTest(
      'emit[LoginLoading, LoginFailure] when repository return an error',
      build: () => loginBlocWithRepositoryError,
      act: (bloc) => bloc.add(LoginSubmitted(
        email: 'ezinne@gmail.com',
        password: '1234',
      )),
      expect: () => [
        LoginLoading(),
        isA<LoginFailure>(),
      ],
    );
  });
}
