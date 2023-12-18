import 'package:shared_preferences/shared_preferences.dart';

class InkuData {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Future<void> setProgress(int day) async {
    final SharedPreferences prefs = await pref;
    await prefs.setInt("day", day);
  }

  Future<int> get day async {
    final SharedPreferences prefs = await pref;
    return prefs.getInt("day") ?? 1;
  }
}
