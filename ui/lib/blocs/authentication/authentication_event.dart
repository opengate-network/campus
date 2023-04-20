part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationLogoutRequested extends AuthenticationEvent {
  const AuthenticationLogoutRequested();
}

class _AuthenticationUserChanged extends AuthenticationEvent {
  const _AuthenticationUserChanged(this.user);

  final User user;
}