import 'package:tetas_in/src/data/dataproviders/auth_data_provider.dart';
import 'package:tetas_in/src/data/models/base_model_response.dart';
import 'package:tetas_in/src/data/models/login_request.dart';
import 'package:tetas_in/src/data/models/login_resposen.dart';

class LoginRepository {
  AuthAPI? authDataProvider;

  Future<LoginResponse> postLogin(String username, String password) async {
    authDataProvider = AuthAPI();

    try {
      print("procces repository");
      LoginRequest user = LoginRequest(username: username, password: password);

      final BaseModelResponse response = await authDataProvider!.login(user);
      print("${response.data} data response");
      print(response.errors);

      if (response.data != null) {
        LoginResponse token = LoginResponse.fromJson(response.data);
        return token;
      }
      return LoginResponse(token: "");
    } catch (e) {
      return LoginResponse(token: "");
    }
  }
}
