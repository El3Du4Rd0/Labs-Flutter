// lib/data/repositories/user_repository_impl.dart

import 'package:shared_preferences/shared_preferences.dart';
import '../services/local_storage_service.dart';

class UserRepository implements LocalStorageService {
  @override
  Future<String?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentUser');
  }
  
  @override
  Future<void> setCurrentUser(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUser', email);
  }

  @override
  Future<void> removeCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUser');
  }
}