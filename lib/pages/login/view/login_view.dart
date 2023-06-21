import 'package:campus/pages/main/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus/pages/login/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: MainAppbarLogo(
                      width: null,
                      opacity: AlwaysStoppedAnimation(
                          ((2 - index).abs() * -1 / 4) + 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Découvrez le campus avec nous',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Campus vous accompagne dans votre vie étudiante à l\'université Gustave Eiffel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () => context.read<LoginCubit>().login(context),
                    child: const Text('Se connecter'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
