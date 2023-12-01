import 'package:tetas_in/src/data/dataproviders/auth_data_provider.dart';
import 'package:tetas_in/src/data/models/login_request.dart';
import 'package:tetas_in/src/data/models/login_resposen.dart';

class AuthRepository {
  final AuthAPI authapi = AuthAPI();

  Future<LoginResponse> postLogin(String username, String password) async {
    try {
      LoginRequest user = LoginRequest(username: username, password: password);
      print("before auth api");
      final response = await authapi.login(user);
      print("after auth api");
      if (response != null) {
        LoginResponse token = LoginResponse.fromJson(response.data);
        return token;
      }
      return LoginResponse(token: "");
    } catch (e) {
      print(e);
      return LoginResponse(token: "");
    }
  }
}
