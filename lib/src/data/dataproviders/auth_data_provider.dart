import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/login_request.dart';

class AuthDataProvider {
  Future<dynamic> login(LoginRequest data) {
    Uri url = Uri.parse("${BaseUrl.fullApiUrl}/authentication");
    var response = http.post(url, body: data);
    return response;
  }
}
