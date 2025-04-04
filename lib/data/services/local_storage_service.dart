
abstract class LocalStorageService {
  Future<String?> getCurrentUser();
  Future<void> setCurrentUser(String email);
  Future<void> removeCurrentUser();
}