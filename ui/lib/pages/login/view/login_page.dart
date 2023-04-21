import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus/pages/login/login.dart';
import 'package:campus/pages/login/view/login_view.dart';
import 'package:campus/repositories/authentication_repository/authentication_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(
          authenticationRepository: context.read<AuthenticationRepositorySupabase>(),
        ),
        child: const LoginView(),
      ),
    );
  }
}
