part of 'controller_bloc.dart';

abstract class ControllerEvent {}

final class UpdateTempLimit extends ControllerEvent {
  int temp;

  UpdateTempLimit({required this.temp});
}

final class UpdateHumdLimit extends ControllerEvent {
  int humd;

  UpdateHumdLimit({required this.humd});
}
