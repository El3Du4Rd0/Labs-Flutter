import '../data/repositories/user_repository_impl.dart';

class UserUseCases {
  final UserRepository _repository;
  
  UserUseCases({UserRepository? repository}) 
      : _repository = repository ?? UserRepository();
  
  Future<String?> getCurrentUser() async {
    return await _repository.getCurrentUser();
  }
  
  Future<void> setCurrentUser(String email) async {
    await _repository.setCurrentUser(email);
  }
  
  Future<void> removeCurrentUser() async {
    await _repository.removeCurrentUser();
  }
}