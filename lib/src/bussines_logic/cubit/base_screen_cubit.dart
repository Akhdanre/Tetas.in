import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tetas_in/src/bussines_logic/notification/notification.dart';
import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';

part 'base_screen_state.dart';

class BaseScreenCubit extends Cubit<BaseScreenState> {
  BaseScreenCubit() : super(BaseScreenInitial());

  void initCubit() async{
    UserData user = UserData();
    String username = await user.username;
    String token = await user.token;

    Notification(token, username);
  }
  void changeMenuPage(){

  }
}
