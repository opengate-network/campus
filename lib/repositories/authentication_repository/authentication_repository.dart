export 'models/user.dart';
export 'authentication_repository_supabase.dart';

import 'models/user.dart';

abstract class AuthenticationRepository {
  User get currentUser;

  Stream<User> get user;

  Future<bool> ssoLogin();

  Future<void> logOut();
}
