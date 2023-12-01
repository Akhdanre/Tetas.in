import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/base_model_response.dart';
import 'package:tetas_in/src/data/models/login_request.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String username, String password) async {
    try {
      emit(AuthLoading());
      // memulai login
      final data = await loginRequest(
          LoginRequest(username: username, password: password));
      var json = jsonDecode(data);
      print(json);
      BaseModel tokendata = BaseModel.fromJson(json);
      if (tokendata.data.token.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: "Invalid credentials"));
      }
    } catch (e) {
      print(e);
      emit(AuthError(message: "An error occurred during login."));
    }
  }

  Future<dynamic> loginRequest(LoginRequest user) async {
    Uri url = Uri.parse("http://192.168.1.13:8000/api/authentication");
    final jsonData =
        jsonEncode({"username": "akeoneuefo", "password": "loremipse"});
    var response = await http.post(url,
        body: jsonData, headers: {"Content-Type": 'application/json'});
    print(response.statusCode);
    return response.body;
  }
}
