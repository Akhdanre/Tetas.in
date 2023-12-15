import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late WebSocketChannel _webSocketChannel;

  HomeBloc() : super(HomeInitial()) {
    _connectToWebSocket();
    progressDay();
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

  progressDay() async {
    http.Response response = await getProgress();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      add(DataProgressRequest(day: data["data"]));
    }
  }

  Future<http.Response> getProgress() async {
    Uri url = Uri.parse("http://${BaseUrl.host}:8000/api/progress/INK0004");

    var response = await http.get(
      url,
      headers: {"Content-Type": 'application/json'},
    );

    return response;
  }

  @override
  Future<void> close() {
    _webSocketChannel.sink.close();
    return super.close();
  }
}
