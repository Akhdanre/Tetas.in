import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/login_request.dart';

class AuthAPI {
  Future<dynamic> login(LoginRequest data) async {
    Uri url = Uri.parse("${BaseUrl.fullApiUrl}/authentication");
    var response = await http.post(url,
        body: data); // menggunakan await untuk mendapatkan respons sebenarnya
    return response.body; // mengembalikan body dari respons
  }
}
