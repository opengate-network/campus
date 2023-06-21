import 'dart:async';
import 'dart:convert';
import 'package:campus/constants.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;

import 'authentication_repository.dart';

class AuthenticationRepositoryAPI extends AuthenticationRepository {
  AuthenticationRepositoryAPI();

  User _currentUser = User.empty;
  final StreamController<User> _userStreamController = StreamController();

  @override
  User get currentUser => _currentUser;

  @override
  Stream<User> get user => _userStreamController.stream;

  @override
  Future<bool> ssoLogin() async {
    _userStreamController.add(const User("", 'name', 'surname', ''));

    var url = Uri.parse('$apiUrl/auth/login_sso');
    final result = await FlutterWebAuth2.authenticate(url: '$apiUrl/auth/login', callbackUrlScheme: urlScheme);

    _userStreamController.add(User.fromJson(jsonDecode(result)));
    return true;
  }

  @override
  Future<void> logOut() async {
    var url = Uri.parse('$apiUrl/auth/logout');
    var response = await http.get(url);

    _userStreamController.add(User.empty);
  }

  void updateUser(User user) {
    _currentUser = user;
    _userStreamController.add(user);
  }
}
