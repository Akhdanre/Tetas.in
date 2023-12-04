import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  late WebSocketChannel _webSocketChannel;
  late Timer _timer;
  late int _tempValue;
  late int _humdValue;
  Duration duration = const Duration(seconds: 3);

  ControllerBloc() : super(ControllerInitial()) {
    _webSocketChannel =
        IOWebSocketChannel.connect('ws://10.10.10.251:8000/ws/control');
    _timer = Timer.periodic(duration, _sendDataIfInactive);
    on<UpdateLimit>((event, emit) {
      _tempValue = event.temp;
      _humdValue = event.humd;
      _timer.cancel(); // Reset the timer when the slider is updated
      _timer = Timer.periodic(duration, _sendDataIfInactive);
    });
  }

  void addLimitValue(int temp, int humd) {
    add(UpdateLimit(temp: temp, humd: humd));
  }

  void _sendDataIfInactive(Timer timer) {
    var json = {
      "sender": "user",
      "action": "send",
      "condition": "update_limit",
      "data": {"temp": _tempValue, "humd": _humdValue}
    };
    _webSocketChannel.sink.add(json);
  }

  @override
  Future<void> close() {
    _timer.cancel(); // Cancel the timer when the bloc is closed
    _webSocketChannel.sink.close();
    return super.close();
  }
}
