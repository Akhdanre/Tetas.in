import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("token", token);
  }

  void setInkubator(List<String> id) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList("inkubator", id);
  }

  Future<String> getToken() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('token') ?? "";
    });
  }

  Future<List<String>> get inkubator async {
    return await _prefs.then((value) => value.getStringList("inkubator") ?? []);
  }
}
