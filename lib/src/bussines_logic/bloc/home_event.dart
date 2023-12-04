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
