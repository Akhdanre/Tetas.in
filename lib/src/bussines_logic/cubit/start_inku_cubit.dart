import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tetas_in/config/base_url.dart';

part 'start_inku_state.dart';

class StartInkuCubit extends Cubit<StartInkuState> {
  StartInkuCubit() : super(StartInkuInitial());

  void startInkuB(String id, String date, int number) {
    try {} catch (e) {
      log("error : $e");
    }
  }

  Future<String> startreq(String id, String date, int number) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/authentication");
    final jsonData = jsonEncode(
        {"id_inkubator": 12, "start_date": date, "number_of_egg": number});

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
