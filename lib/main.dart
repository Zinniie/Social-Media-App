import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/data/repository/MockAuthRepository.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:social_media_app/features/auth/presentation/bloc/register_bloc.dart';
import 'package:social_media_app/features/auth/presentation/screens/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => RegisterBloc(
            registerUseCase:
                RegisterUseCase(authRepository: MockAuthRepository())),
        child: const RegisterPage(),
      ),
    );
  }
}
