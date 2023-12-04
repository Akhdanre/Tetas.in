import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late WebSocketChannel _webSocketChannel;

  HomeBloc() : super(HomeInitial()) {
    _webSocketChannel =
        IOWebSocketChannel.connect('ws://10.10.10.251:8000/ws/control');
    onWsListen();
  }

  void onWsListen() {
    _webSocketChannel.stream.listen((message) {
      Map<String, dynamic> data = json.decode(message);
      if (data['sender'] == 'inku' &&
          data['action'] == 'post' &&
          data['request'] == 'send_data') {
        double temp = data['data']['temp'];
        double humd = data['data']['humd'];
        double water = data['data']['water'];
      }
    });
  }

  void UpdateInfoInkuValue(int temp, int humd, int water) =>
      on<UpdateDataRequest>(
        (event, emit) {
          emit(HomeUpdate(temp: temp, humd: humd, waterVolume: water));
        },
      );

  @override
  Future<void> close() {
    _webSocketChannel.sink.close();
    return super.close();
  }
}
