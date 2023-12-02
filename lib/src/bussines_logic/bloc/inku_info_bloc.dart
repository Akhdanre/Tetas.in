import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'inku_info_event.dart';
part 'inku_info_state.dart';

class InkuInfoBloc extends Bloc<InkuInfoEvent, InkuInfoState> {
  InkuInfoBloc() : super(InkuInfoInitial()) {
    listenWebsocket();
  }

  final socket = WebSocket("ws://192.168.194.229:8000/ws/control");

  void listenWebsocket() {
    socket.onMessage.listen((event) {
      var message = jsonDecode(event.data);
      switch (message["request"]) {
        case "send_data":
          Map<String, dynamic> data = message["data"];

          add(SendDataEvent(data));
          break;
        default:
          emit(InkuInfoException());
      }
    });
  }

  @override
  Stream<InkuInfoState> mapEventToState(InkuInfoEvent event) async* {
    if (event is SendDataEvent) {
    }
  }
}
