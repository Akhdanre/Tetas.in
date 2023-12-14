part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {
  int defaultValue;
  HomeInitial({this.defaultValue = 0});
}

final class HomeUpdate extends HomeState {
  int temp;
  int humd;
  int waterVolume;

  HomeUpdate(
      {required this.temp, required this.humd, required this.waterVolume});
}

final class UpdateDayProgress extends HomeState {
  int day;

  UpdateDayProgress({required this.day});
}

final class NotOnProgress extends HomeState {}