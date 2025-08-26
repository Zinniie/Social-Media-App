import 'package:social_media_app/features/auth/data/datasources/session_local_data_source.dart';

class UserSessionService {
  final SessionLocalDataSource sessionLocalDataSource;

  UserSessionService({required this.sessionLocalDataSource});

  Future<void> persistToken({required String token})async {
    await sessionLocalDataSource.saveToken(token: token);
  }

  Future<String?> getUserSession() {
    return sessionLocalDataSource.getToken();
  }

  Future<void> logout() {
    return sessionLocalDataSource.deleteToken();
  }

  Future<bool> isLoggedIn() async {
    final token = await sessionLocalDataSource.getToken();
    return token != null && token.isNotEmpty;
  }
}
