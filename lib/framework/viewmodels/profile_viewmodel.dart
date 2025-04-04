// lib/framework/viewmodels/profile_viewmodel.dart

import 'package:flutter/material.dart';
import '../../domain/user_usecases.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserUseCases _userUseCases = UserUseCases();
  String _email = '';
  
  String get email => _email;
  
  ProfileViewModel() {
    _loadUserEmail();
  }
  
  Future<void> _loadUserEmail() async {
    final email = await _userUseCases.getCurrentUser();
    if (email != null) {
      _email = email;
      notifyListeners();
    }
  }
  
  Future<void> logout() async {
    await _userUseCases.removeCurrentUser();
    _email = '';
    notifyListeners();
  }
}