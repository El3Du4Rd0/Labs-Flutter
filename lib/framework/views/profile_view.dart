// lib/framework/views/profile_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileScreen({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 24),

            Consumer<ProfileViewModel>(builder: (context, viewModel, child) {
              return Text(
                viewModel.email,
                style: Theme.of(context).textTheme.headlineSmall,
              );
            }),

            const SizedBox(height: 48),

            Consumer<ProfileViewModel>(builder: (context, viewModel, child) {
              return ElevatedButton.icon(
                onPressed: () {
                  viewModel.logout();
                  onLogout();
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text('Cerrar Sesión',
                    style: TextStyle(color: Colors.red)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.red),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}