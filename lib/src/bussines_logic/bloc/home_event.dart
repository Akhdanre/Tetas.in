part of 'home_bloc.dart';

abstract class HomeEvent {}

final class InitialDataRequest extends HomeEvent {}

final class UpdateDataRequest extends HomeEvent {
  int temp;
  int humd;
  int water;

  UpdateDataRequest(
      {required this.temp, required this.humd, required this.water});
}

final class DataProgressRequest extends HomeEvent {
  int day;

  DataProgressRequest({required this.day});
}

final class DataInkubatorRequest extends HomeEvent {
  List<String> id;

  DataInkubatorRequest({required this.id});
}

final class DataInkubatorSwitch extends HomeEvent {
  String id;
  
  DataInkubatorSwitch({required this.id});
}
