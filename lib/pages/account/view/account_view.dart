import 'package:campus/repositories/authentication_repository/authentication_repository_supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountSectionTitle(text: 'Mon compte'),
              InkWell(
                child: ListTile(
                  title: Text(context
                      .read<AuthenticationRepositorySupabase>()
                      .currentUser
                      .name),
                  subtitle: Text(context
                      .read<AuthenticationRepositorySupabase>()
                      .currentUser
                      .email),
                ),
              ),
              const Divider(height: 1),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('Mon établissement'),
                  subtitle: Text('ESIEE Paris'),
                ),
              ),
              const Divider(height: 1),
              InkWell(
                onTap: () =>
                    context.read<AuthenticationRepositorySupabase>().logOut(),
                child: const ListTile(
                  title: Text('Se déconnecter'),
                ),
              ),
              const AccountSectionTitle(text: 'Paiement'),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('Cartes bancaires'),
                ),
              ),
              const Divider(height: 1),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('Factures'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountSectionTitle extends StatelessWidget {
  final String text;

  const AccountSectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        text,
        style: theme.textTheme.bodyLarge?.merge(
          TextStyle(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class AccountListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(),
    );
  }
}
