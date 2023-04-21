import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus/app/routes.dart';
import 'package:campus/blocs/authentication/authentication_bloc.dart';
import 'package:campus/repositories/authentication_repository/authentication_repository_supabase.dart';

import 'theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepositorySupabase authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositorySupabase _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AuthenticationStatus>(
        state: context.select((AuthenticationBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
