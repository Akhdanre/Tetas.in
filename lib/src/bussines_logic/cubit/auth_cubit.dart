import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tetas_in/config/base_url.dart';
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
      if (data != null) {
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
    print("${BaseUrl.fullApiUrl}/authentication");
    Uri url = Uri.http("10.10.10.251:8000", "/api/authentication");
    var response = await http.post(url,
        body: user
            .toJson()); // menggunakan await untuk mendapatkan respons sebenarnya
    return response.body; // mengembalikan body dari respons
  }
}
