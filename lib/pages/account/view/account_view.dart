import 'package:campus/repositories/authentication_repository/authentication_repository_supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthenticationRepositorySupabase>().logOut();
      },
      child: const Text('Logout'),
    );
  }
}
