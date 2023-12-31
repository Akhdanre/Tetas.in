import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
import 'package:tetas_in/src/utils/shared_preferences/inku_data.dart';
import 'package:tetas_in/src/utils/shared_preferences/user_data.dart';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late WebSocketChannel _webSocketChannel;
  late String inkuid;

  HomeBloc() : super(HomeInitial()) {
    inkubatorId();
    _connectToWebSocket();

    on<UpdateDataRequest>(
      (event, emit) {
        emit(HomeUpdate(
          temp: event.temp,
          humd: event.humd,
          waterVolume: event.water,
        ));
      },
    );

    on<DataProgressRequest>(
      (event, emit) {
        emit(UpdateDayProgress(day: event.day));
      },
    );

    on<DataInkubatorRequest>(
      (event, emit) {
        progressDay(inkuid);
        emit(UpdateInkubatorList(id: event.id));
      },
    );

    on<DataInkubatorSwitch>(
      (event, emit) => emit(UpdateInkubatorSwitch(id: event.id)),
    );
  }

  void _connectToWebSocket() {
    Uri webSocketUri = Uri.parse('ws://${BaseUrl.host}:8000/ws/control');
    _webSocketChannel = IOWebSocketChannel.connect(webSocketUri);

    onWsListen();
    requestFirstInfo();
  }

  void requestFirstInfo() {
    var data = {"sender": "inku", "action": "get", "request": "info_inku"};
    _webSocketChannel.sink.add(jsonEncode(data));
  }

  void onWsListen() {
    _webSocketChannel.stream.listen(
      (message) {
        try {
          Map<String, dynamic> data = json.decode(message);
          if (data['sender'] == 'inku' &&
              data['action'] == 'post' &&
              data['request'] == 'send_data') {
            updateDataInfo(data["data"]);
          }

          if (data['sender'] == 'server' && data['action'] == 'send_info') {
            updateDataInfo(data["data"]);
          }
        } catch (e) {
          log('Error decoding WebSocket message: $e');
        }
      },
      onError: (error) {
        log('WebSocket error: $error');
      },
      onDone: () {
        Future.delayed(const Duration(seconds: 3));
        _connectToWebSocket();
      },
    );
  }

  updateDataInfo(Map data) {
    int temp = data['temp'];
    int humd = data['humd'];
    int water = data['water'];
    add(UpdateDataRequest(temp: temp, humd: humd, water: water));
  }

  progressDay(String id) async {
    http.Response response = await getProgress(id);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      InkuData().setProgress(data["data"]);
      add(DataProgressRequest(day: data["data"]));
    }
    if (response.statusCode == 401) {
      InkuData().setProgress(0);
    }
  }

  changeDayDescription() {}

  Future<http.Response> getProgress(String id) async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/progress/$id");

    var response = await http.get(
      url,
      headers: {"Content-Type": 'application/json'},
    );

    return response;
  }

  inkubatorId() async {
    http.Response response = await getInkubator();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<String> id = (data["data"] as List).map((e) => e as String).toList();
      UserData().setInkubator(id);
      inkuid = id[0];
      add(DataInkubatorRequest(id: id));
    }
  }

  Future<http.Response> getInkubator() async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/inku");
    String token = await UserData().token;
    var response = await http.get(
      url,
      headers: {"Content-Type": 'application/json', "X-API-TOKEN": token},
    );
    return response;
  }

  @override
  Future<void> close() {
    _webSocketChannel.sink.close();
    return super.close();
  }
}
