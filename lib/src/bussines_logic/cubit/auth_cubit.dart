import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String username, String password) async {
    try {
      emit(AuthLoading());
      Future.delayed(Duration(seconds: 2));
      //memulai login
      if (username == "ipul" && password == "none") {
        emit(AuthSuccess(token: "lkjelk-kh23kns-kn3k"));
      } else {
        emit(AuthError(message: "Invalid credentials"));
      }
    } catch (e) {
      emit(AuthError(message: "An error occurred during login."));
    }
  }
}
