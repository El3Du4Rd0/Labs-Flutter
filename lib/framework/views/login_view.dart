import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;

  const LoginScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            const Text(
              'Pokedex',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Consumer<LoginViewModel>(builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: viewModel.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Correo Electrónico',
                      border: UnderlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                  ),
                ],
              );
            }),
            const Spacer(),
            Consumer<LoginViewModel>(builder: (context, viewModel, child) {
              return ElevatedButton(
                onPressed: () {
                  viewModel.setCurrentUser();
                  if (!viewModel.hasError) {
                    onLogin();
                  }
                },
                child: const Text('Acceder'),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}