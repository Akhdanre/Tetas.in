import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/history_model.dart';
import 'package:http/http.dart' as http;
import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    getDataHistory();
    on<HistoryDataEvent>((event, emit) {
      emit(HistoryData(data: event.data));
    });
  }

  void getDataHistory() async {
    http.Response response = await getHistory();
    if (response.statusCode == 200) {
      var data = EggIncubatorResponse.fromJson(jsonDecode(response.body));
      add(HistoryDataEvent(data: data.data));
    }
  }

  Future<http.Response> getHistory() async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/data/report");
    String token = await UserData().token;
    var response = await http.get(
      url,
      headers: {"Content-Type": 'application/json', "X-API-TOKEN": token},
    );

    return response;
  }

  // @override
  // Future<void> close() {
  //   return super.close();
  // }
}
