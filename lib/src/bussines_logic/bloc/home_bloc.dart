import 'package:bloc/bloc.dart';
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

    on<UpdateDataRequest>(
      (event, emit) {
        emit(HomeUpdate(
            temp: event.temp, humd: event.humd, waterVolume: event.water));
      },
    );
  }

  void onWsListen() {
    _webSocketChannel.stream.listen(
      (message) {
        Map<String, dynamic> data = json.decode(message);
        if (data['sender'] == 'inku' &&
            data['action'] == 'post' &&
            data['request'] == 'send_data') {
          int temp = data['data']['temp'];
          int humd = data['data']['humd'];
          int water = data['data']['water'];
          add(UpdateDataRequest(temp: temp, humd: humd, water: water));
        }
      },
      onError: (error) {
        print('WebSocket error: $error');

        _webSocketChannel.sink.close();

        _webSocketChannel =
            IOWebSocketChannel.connect('ws://10.10.10.251:8000/ws/control');
      },
    );
  }

  @override
  Future<void> close() {
    _webSocketChannel.sink.close();
    return super.close();
  }
}
