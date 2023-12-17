import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setUser(String username, String name, String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("username", username);
    await prefs.setString("name", name);
    await prefs.setString("token", token);
  }

  void setInkubator(List<String> id) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList("inkubator", id);
  }

  Future<String> get username async {
    return await _prefs.then((value) => value.getString("username") ?? "");
  }

  Future<String> get name async {
    return await _prefs.then((value) => value.getString("name") ?? "");
  }

  Future<String> get token async {
    return await _prefs.then((value) => value.getString("token") ?? "");
  }

  Future<List<String>> get inkubator async {
    return await _prefs.then((value) => value.getStringList("inkubator") ?? []);
  }
}
