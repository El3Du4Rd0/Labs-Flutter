// lib/framework/viewmodels/login_viewmodel.dart

import 'package:flutter/material.dart';
import '../../domain/user_usecases.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final UserUseCases _userUseCases = UserUseCases();
  
  String _errorMessage = '';
  bool _hasError = false;
  
  String get errorMessage => _errorMessage;
  bool get hasError => _hasError;
  
  LoginViewModel() {
    _checkCurrentUser();
  }
  
  void _checkCurrentUser() async {
    final email = await _userUseCases.getCurrentUser();
    if (email != null && email.isNotEmpty) {
      emailController.text = email;
    }
  }
  
  void setCurrentUser() {
    final email = emailController.text.trim();
    
    if (email.isEmpty) {
      _errorMessage = 'Correo inválido';
      _hasError = true;
      notifyListeners();
      
      // Mostrar SnackBar o Dialog aquí
      return;
    }
    
    _userUseCases.setCurrentUser(email);
    _hasError = false;
    notifyListeners();
  }
  
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}