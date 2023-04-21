import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:campus/app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:campus/repositories/authentication_repository/authentication_repository_supabase.dart';

const SUPABASE_URL = String.fromEnvironment('SUPABASE_URL');
const SUPABASE_ANON_KEY = String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  final authenticationRepository = AuthenticationRepositorySupabase();

  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
