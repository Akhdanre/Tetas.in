import 'package:http/http.dart' as http;
import 'package:tetas_in/src/data/models/login_request.dart';

class AuthAPI {
  Future<dynamic> login(LoginRequest data) async {
    Uri url = Uri.http("192.168.1.13:8000", "/api/authentication");
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) return response;
    return null;
  }
}
