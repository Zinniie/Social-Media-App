import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:social_media_app/features/auth/data/datasources/session_local_data_source.dart';
import 'package:social_media_app/features/auth/data/repository/MockAuthRepository.dart';
import 'package:social_media_app/features/auth/domain/services/user_session_service.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:social_media_app/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:social_media_app/features/auth/presentation/login/screens/login_page.dart';
import 'package:social_media_app/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:social_media_app/features/auth/presentation/register/screens/register_page.dart';
import 'package:social_media_app/features/feed/data/repository/mock_posts_repository.dart';
import 'package:social_media_app/features/feed/domain/usecases/fetch_posts_use_case.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_app/features/feed/presentation/screens/feed_page.dart';
import 'package:social_media_app/features/splash/splash_page.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  
  Widget build(BuildContext context) {
      final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

    final SessionLocalDataSource sessionLocalDataSource =
        SessionLocalDataSourceImpl(secureStorage: secureStorage);

    final UserSessionService userSessionService =
        UserSessionService(sessionLocalDataSource: sessionLocalDataSource);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterBloc(
                registerUseCase: RegisterUseCase(
                  authRepository: MockAuthRepository(),
                ),
                userSessionService: userSessionService),
          ),
          BlocProvider(
            create: (_) => LoginBloc(
                loginUseCase: LoginUseCase(
                  authRepository: MockAuthRepository(),
                ),
                userSessionService: userSessionService),
          ),
          BlocProvider(
            create: (_) => FeedBloc(
                fetchPostsUseCase: FetchPostsUseCase(
                  postRepository: MockPostsRepository(),
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
         // initialRoute: '/login',
        home: SplashPage(userSessionService: userSessionService),
          routes: {
            '/register': (context) => const RegisterPage(),
            '/login': (context) => const LoginPage(),
            '/home': (context) =>const FeedPage(),
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
