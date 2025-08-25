import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:social_media_app/features/auth/presentation/bloc/register_bloc.dart';
import 'package:social_media_app/features/auth/presentation/bloc/register_event.dart';
import 'package:social_media_app/features/auth/presentation/bloc/register_state.dart';

import '../../data/repository/MockAuthRepository.dart';

// UI -> RegisterEventForSubmitting(event) -> LoadingState(1) || SuccessState(2) -> UI how  bloc woprks
void main() {
  group('RegisterBloc test', () {
    late RegisterBloc registerBloc;
    late RegisterBloc registerBlocWithRepositoryError;

    setUp(() {
      registerBloc = RegisterBloc(
          registerUseCase:
              RegisterUseCase(authRepository: MockAuthRepository()));
                registerBlocWithRepositoryError = RegisterBloc(
          registerUseCase:
              RegisterUseCase(authRepository: MockAuthWithErrorRepository()));
    });
    blocTest(
      'emit [RegisterLoading, RegisterSuccess] when register is successful',
      build: () => registerBloc,
      act: (bloc) => bloc.add(RegisterSubmitted(
        email: 'ezinne@gmail.com',
        username: 'ezinne',
        password: '1234',
      )),
      expect: () => [
        RegisterLoading(),
        RegisterSuccess(),
      ],
    );

     blocTest(
      'emit [RegisterLoading, RegisterFailure] when email is wrong',
      build: () => registerBloc,
      act: (bloc) => bloc.add(RegisterSubmitted(
        email: 'ezinne',
        username: 'ezinne',
        password: '1234',
      )),
      expect: () => [
        RegisterLoading(),
        isA<RegisterFailure>(),
      ],
    );
     blocTest(
      'emit [RegisterLoading, RegisterFailure] when repository return an error',
      build: () => registerBlocWithRepositoryError,
      act: (bloc) => bloc.add(RegisterSubmitted(
        email: 'ezinne@gmail.com',
        username: 'ezinne',
        password: '1234',
      )),
      expect: () => [
        RegisterLoading(),
        isA<RegisterFailure>(),
      ],
    );
  });
}
