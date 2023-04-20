import 'models/user.dart';

export 'models/user.dart';

abstract class AuthenticationRepository {
  User get currentUser;

  Stream<User> get user;

  Future<void> logOut();
}
