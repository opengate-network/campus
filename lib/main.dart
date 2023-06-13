import 'package:flutter/material.dart';
import 'package:campus/app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:campus/repositories/authentication_repository/authentication_repository_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  final authenticationRepository = AuthenticationRepositoryAPI();

  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
