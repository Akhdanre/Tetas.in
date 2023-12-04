part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {
  double defaultValue;
  HomeInitial({this.defaultValue = 0});
}

final class HomeUpdate extends HomeState {
  double temp;
  double humd;
  double waterVolume;

  HomeUpdate(
      {required this.temp, required this.humd, required this.waterVolume});
}
