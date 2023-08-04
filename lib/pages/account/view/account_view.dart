import 'package:campus/repositories/authentication_repository/authentication_repository_api.dart';
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
                      .read<AuthenticationRepositoryAPI>()
                      .currentUser
                      .name),
                  subtitle: Text(context
                      .read<AuthenticationRepositoryAPI>()
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
                    context.read<AuthenticationRepositoryAPI>().logOut(),
                child: const ListTile(
                  title: Text('Se déconnecter'),
                ),
              ),
              const AccountSectionTitle(text: 'Mes structures'),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('ESIEESPACE'),
                  subtitle: Text('Association'),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://media.licdn.com/dms/image/C4E0BAQGG9rorK4ToVw/company-logo_200_200/0/1660766901821?e=2147483647&v=beta&t=3PHkrn0hjamfzppryw96zmFFd_Po_h361dbeu8RSxj4"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('Club musique'),
                  subtitle: Text('Club associé à BDE ESIEE Paris'),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/logos/components/esiee.png"),
                  ),
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
  const AccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(),
    );
  }
}
