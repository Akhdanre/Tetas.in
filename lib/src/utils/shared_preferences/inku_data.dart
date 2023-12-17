import 'package:shared_preferences/shared_preferences.dart';

class InkuData {
  late final SharedPreferences pref;
  InkuData() {
    initShared();
  }

  initShared() async {
    pref = await SharedPreferences.getInstance();
  }

  set progress(int day) {
    pref.setInt("day", day);
  }
}
