import 'package:http/http.dart' as http;

abstract class IApiPostsManager {
  Future<dynamic> callApiRequest(String param);
}

class ApiPostsManager extends IApiPostsManager {
  final String url = "https://jsonplaceholder.typicode.com/";
  @override
  Future<dynamic> callApiRequest(String param) async {
    var urlWithParams = Uri.parse(url + param);
    var response = await http.get(urlWithParams);
    return response.body;
  }
}
