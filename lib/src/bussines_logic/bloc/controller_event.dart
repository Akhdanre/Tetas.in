part of 'controller_bloc.dart';

abstract class ControllerEvent {}

final class UpdateLimit extends ControllerEvent {
  int temp;
  int humd;

  UpdateLimit({required this.temp, required this.humd});
}
