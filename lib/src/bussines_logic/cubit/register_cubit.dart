import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/inku_user_request.dart';
import 'package:tetas_in/src/data/models/user_request.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String username, String password, String name,
      String idInku, String token) async {
    try {
      emit(RegisterLoading());
      RegisterRequest requestRequirement =
          RegisterRequest(username: username, password: password, name: name);

      InkuUserRequest inku =
          InkuUserRequest(id: idInku, token: token, username: username);
      http.Response data = await registerRequest(requestRequirement);
      var dataMap = jsonDecode(data.body);
      var result = await inkuRequest(inku);
      var dataInkures = jsonDecode(result);

      if (dataMap["data"] == "ok" && dataInkures["data"] == "ok") {
        emit(RegisterSuccess());
      } else if (dataMap["data"] == null) {
        emit(RegisterError(message: "check again your field"));
      } else if (dataInkures["data"] == null) {
        emit(RegisterError(message: dataInkures["errors"]));
      }
    } catch (e) {
      log("error : $e");
      emit(RegisterError(message: "Cek kembali data field anda"));
    }
  }

  Future<http.Response> registerRequest(RegisterRequest request) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/user");
    final jsonData = jsonEncode(request.toJson());

    var response = await http.post(
      url,
      body: jsonData,
      headers: {"Content-Type": 'application/json'},
    );

    return response;
  }

  Future<String> inkuRequest(InkuUserRequest inkureq) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/inku/user");
    final jsonData = jsonEncode(inkureq.toJson());

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
      throw Exception(e);
    }
  }
}
