import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tetas_in/config/base_url.dart';
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
  int time = 2;
  bool isvalueChange = false;

  ControllerBloc() : super(ControllerInitial()) {
    _connect();
    on<UpdateTempLimit>((event, emit) {
      isvalueChange = true;
      time = 2;
      _tempValue = event.temp;
      emit(ControllerTempUpdate(tempSliderValue: event.temp));
      _startTimer();
    });

    on<UpdateHumdLimit>((event, emit) {
      isvalueChange = true;
      time = 2;
      _humdValue = event.humd;
      emit(ControllerHumdUpdate(humdSliderValue: event.humd));
      _startTimer();
    });

    on<ShowSnackBarEvent>(
      (event, emit) => emit(ShowSnackbarState()),
    );
  }

  void _connect() {
    _webSocketChannel =
        IOWebSocketChannel.connect('ws://${BaseUrl.host}:8000/ws/control');
    _webSocketChannel.stream.listen(
      (dynamic data) {},
      onDone: () {
        _reconnect();
      },
      onError: (error) {
        log(error);
        _reconnect();
      },
      cancelOnError: true,
    );
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () {
      _webSocketChannel.sink.close();

      _connect();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(duration, (timer) {
      if (time == 0 && isvalueChange) {
        timer.cancel();
        isvalueChange = false;
        _sendToInku();
        add(ShowSnackBarEvent());
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
