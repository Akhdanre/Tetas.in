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
  Duration duration = const Duration(seconds: 1);
  int time = 3;
  bool isvalueChange = false;

  ControllerBloc() : super(ControllerInitial()) {
    _webSocketChannel =
        IOWebSocketChannel.connect('ws://10.10.10.251:8000/ws/control');

    on<UpdateTempLimit>((event, emit) {
      isvalueChange = true;
      time = 3;
      _tempValue = event.temp;
      emit(ControllerTempUpdate(tempSliderValue: event.temp));
      _startTimer(emit);
    });

    on<UpdateHumdLimit>((event, emit) {
      isvalueChange = true;
      time = 3;
      _humdValue = event.humd;
      emit(ControllerHumdUpdate(humdSliderValue: event.humd));
      _startTimer(emit);
    });
  }

  void _startTimer(Emitter<ControllerState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(duration, (timer) {
      if (time == 0 && isvalueChange) {
        timer.cancel();
        isvalueChange = false;
        _sendToInku();
        emit(ShowScaffold());
      }
      time--;
    });
  }

  void _sendToInku() {
    var json = {
      "sender": "user",
      "action": "send",
      "condition": "update_limit",
      "data": {"temp": _tempValue, "humd": _humdValue}
    };
    _webSocketChannel.sink.add(jsonEncode(json));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _webSocketChannel.sink.close();
    return super.close();
  }
}
