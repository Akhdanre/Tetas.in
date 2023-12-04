import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(ControllerInitial()) {
    on<ControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
