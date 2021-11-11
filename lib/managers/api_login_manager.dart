abstract class IApiLoginManager {
  Future<dynamic> callApiRequest(String url);
}

class ApiLoginManager extends IApiLoginManager {
  @override
  Future<dynamic> callApiRequest(String url) async {
    final list = url.split('&');
    final email = list[0];
    final password = list[1];
    await Future.delayed(const Duration(seconds: 3));
    if (email == 'flutter.school@gmail.com' && password == 'Bestee5') {
      return true;
    }
    return false;
  }
}
