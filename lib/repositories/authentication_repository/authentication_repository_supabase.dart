import 'package:supabase_flutter/supabase_flutter.dart' as supabase_auth;
import 'package:campus/constants.dart';

import 'authentication_repository.dart';

class AuthenticationRepositorySupabase extends AuthenticationRepository {
  AuthenticationRepositorySupabase();

  final _authClient = supabase_auth.Supabase.instance.client.auth;

  @override
  User get currentUser => _authClient.currentUser?.toUser() ?? User.empty;

  @override
  Stream<User> get user => _authClient.onAuthStateChange
      .map((state) => state.session?.user.toUser() ?? User.empty);

  @override
  Future<bool> ssoLogin() async {
    return await _authClient.signInWithOAuth(
      supabase_auth.Provider.keycloak,
      redirectTo: '${urlScheme}login',
      scopes: 'openid,email',
    );
  }

  @override
  Future<void> logOut() async {
    await _authClient.signOut();
  }
}

extension on supabase_auth.User {
  User toUser() {
    Map<String, dynamic> json = {};
    json.addAll(userMetadata ?? {});
    json['id'] = id;
    json['email'] = email;
    json['role'] = role;
    return User.fromJson(json);
  }
}
