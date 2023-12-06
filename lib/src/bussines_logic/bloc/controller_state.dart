part of 'controller_bloc.dart';

abstract class ControllerState {}

final class ControllerInitial extends ControllerState {
  int tempDefaultValue;
  int humdDefaultValue;

  ControllerInitial({this.tempDefaultValue = 38, this.humdDefaultValue = 58});
}

final class ControllerTempUpdate extends ControllerState {
  int tempSliderValue;

  ControllerTempUpdate({required this.tempSliderValue});
}

final class ControllerHumdUpdate extends ControllerState {
  int humdSliderValue;

  ControllerHumdUpdate({required this.humdSliderValue});
}

final class ShowSnackbarState extends ControllerState {}

final class ControllerError extends ControllerState {}
