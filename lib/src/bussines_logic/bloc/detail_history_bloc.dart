import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/data/models/detail_hatch_data.dart';

import 'package:http/http.dart' as http;
part 'detail_history_event.dart';
part 'detail_history_state.dart';

class DetailHistoryBloc extends Bloc<DetailHistoryEvent, DetailHistoryState> {
  DetailHistoryBloc() : super(DetailHistoryInitial()) {
    on<UpdateDataDetail>((event, emit) async {
      http.Response response = await getDetailData(event.id);
      if (response.statusCode == 200) {
        var data = Data.fromJson(jsonDecode(response.body));
        emit(DetailHistoryUpdate(data: data.data));
      }
    });
  }

  getDetailData(int id) async {
    Uri url =
        Uri.parse("http://${BaseUrl.host}:8000/api/data/report/detail/$id");
    var response = await http.get(
      url,
      headers: {"Content-Type": 'application/json'},
    );
    return response;
  }
}
