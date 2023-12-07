import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/base_model_response.dart';
import 'package:tetas_in/src/data/models/login_request.dart';
import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(AuthLoading());

      final data = await loginRequest(
          LoginRequest(username: username, password: password));
      var jsonData = jsonDecode(data);
      BaseModel tokendata = BaseModel.fromJson(jsonData);

      if (tokendata.data.token.isNotEmpty) {
        UserData().setToken(tokendata.data.token);
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: "Invalid credentials"));
      }
    } catch (e) {
      log("error : $e");
      emit(AuthError(message: "An error occurred during login."));
    }
  }

  Future<String> loginRequest(LoginRequest user) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/authentication");
    final jsonData = jsonEncode(user.toJson());

    try {
      var response = await http.post(
        url,
        body: jsonData,
        headers: {"Content-Type": 'application/json'},
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed to authenticate");
      }
    } catch (e) {
      throw Exception("Failed to communicate with the server");
    }
  }
}
