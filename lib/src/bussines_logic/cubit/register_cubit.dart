import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/user_request.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String username, String password, String name) async {
    try {
      emit(RegisterLoading());
      RegisterRequest requestRequirement =
          RegisterRequest(username: username, password: password, name: name);
      var data = await registerRequest(requestRequirement);
      var dataMap = jsonDecode(data);
      if (dataMap["data"] == "ok") {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(message: "Invalid credentials"));
      }
    } catch (e) {
      log("error : $e");
      emit(RegisterError(message: "An error occurred during register."));
    }
  }

  Future<String> registerRequest(RegisterRequest request) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/user");
    final jsonData = jsonEncode(request.toJson());

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
