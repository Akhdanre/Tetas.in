import 'package:http/http.dart' as http;
import 'package:tetas_in/src/data/models/login_request.dart';

class AuthAPI {
  Future<dynamic> login(LoginRequest data) async {
    Uri url = Uri.http("10.10.10.251:8000", "/api/authentication");
    var response = await http.post(url, body: data);
    return response;
  }
}
