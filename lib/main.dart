import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/data/repository/MockAuthRepository.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:social_media_app/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:social_media_app/features/auth/presentation/login/screens/login_page.dart';
import 'package:social_media_app/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:social_media_app/features/auth/presentation/register/screens/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterBloc(
              registerUseCase: RegisterUseCase(
                authRepository: MockAuthRepository(),
              ),
            ),
          ),
          BlocProvider(
            create: (_) => LoginBloc(
              loginUseCase: LoginUseCase(
                authRepository: MockAuthRepository(),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/login',
          routes: {
            '/register': (context) => RegisterPage(),
            '/login': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ezinne Blessing Nnabugwu'),
      ),
    );
  }
}
