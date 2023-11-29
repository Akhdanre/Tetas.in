import 'package:tetas_in/src/data/dataproviders/auth_data_provider.dart';
import 'package:tetas_in/src/data/models/login_request.dart';
import 'package:tetas_in/src/data/models/login_resposen.dart';

class LoginRepository {
  late final AuthDataProvider authDataProvider;

  // LoginRepository(this.authDataProvider);

  Future<LoginResponse> postLogin(String username, String password) async {
    try {
      LoginRequest user = LoginRequest(username: username, password: password);

      // Make sure authDataProvider.login returns a non-null value
      final response = await authDataProvider.login(user);
      if (response != null) {
        final LoginResponse loginResponse = LoginResponse.fromJson(response);
        return loginResponse;
      } else {
        return LoginResponse(token: "");
      }
    } catch (e) {
      print('Login failed: $e');

      return LoginResponse(token: "");
    }
  }
}
