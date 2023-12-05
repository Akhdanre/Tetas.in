import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  late WebSocketChannel _webSocketChannel;
  Timer? _timer;
  int _tempValue = 39;
  int _humdValue = 70;
  Duration duration = const Duration(seconds: 3);

  ControllerBloc() : super(ControllerInitial()) {
    _webSocketChannel =
        IOWebSocketChannel.connect('ws://10.10.10.251:8000/ws/control');

    on<UpdateTempLimit>((event, emit) {
      _tempValue = event.temp;
      emit(ControllerTempUpdate(tempSliderValue: event.temp));
      if (_timer != null) {
        _timer!.cancel();
      }
      _timer = Timer.periodic(duration, _sendDataIfInactive);
    });

    on<UpdateHumdLimit>((event, emit) {
      _humdValue = event.humd;
      emit(ControllerHumdUpdate(humdSliderValue: event.humd));
      if (_timer != null) {
        _timer!.cancel();
      }
      _timer = Timer.periodic(duration, _sendDataIfInactive);
    });
  }

  void addTempLimitValue(int tempLimit) {
    add(UpdateTempLimit(temp: tempLimit));
  }

  void addHumdLimitValue(int humdLimit) {
    add(UpdateHumdLimit(humd: humdLimit));
  }

  void _sendDataIfInactive(Timer timer) {
    var json = {
      "sender": "user",
      "action": "send",
      "condition": "update_limit",
      "data": {"temp": _tempValue, "humd": _humdValue}
    };

    var jsonString = jsonEncode(json); // Convert the Dart map to a JSON string
    _webSocketChannel.sink
        .add(jsonString); // Send the JSON string through the WebSocket channel
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Cancel the timer when the bloc is closed
    _webSocketChannel.sink.close();
    return super.close();
  }
}
