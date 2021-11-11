import 'package:bru/managers/api_login_manager.dart';

abstract class IUserRepository {
  Future<bool> loginUser(String login, String password);

  Future<void> logout();
}

class UserRepository extends IUserRepository {
  final IApiLoginManager apiManager;

  UserRepository({required this.apiManager});

  @override
  Future<bool> loginUser(String login, String password) async {
    return await apiManager.callApiRequest('$login&$password');
  }

  @override
  Future<void> logout() async {}
}
