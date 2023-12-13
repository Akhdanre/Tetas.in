import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late WebSocketChannel _webSocketChannel;

  HomeBloc() : super(HomeInitial()) {
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
  }

  void _connectToWebSocket() {
    Uri webSocketUri = Uri.parse('ws://${BaseUrl.host}:8000/ws/control');
    _webSocketChannel = IOWebSocketChannel.connect(webSocketUri);

    onWsListen();
    
  }

  void onWsListen() {
    _webSocketChannel.stream.listen(
      (message) {
        try {
          Map<String, dynamic> data = json.decode(message);
          if (data['sender'] == 'inku' &&
              data['action'] == 'post' &&
              data['request'] == 'send_data') {
            int temp = data['data']['temp'];
            int humd = data['data']['humd'];
            int water = data['data']['water'];
            add(UpdateDataRequest(temp: temp, humd: humd, water: water));
          }
        } catch (e) {
          // Handle JSON decoding errors
          print('Error decoding WebSocket message: $e');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        // WebSocket is closed
        _connectToWebSocket();
      },
    );
  }

  @override
  Future<void> close() {
    _webSocketChannel.sink.close();
    return super.close();
  }
}
