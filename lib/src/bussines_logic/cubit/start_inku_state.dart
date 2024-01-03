part of 'start_inku_cubit.dart';

class StartInkuState {}

final class StartInkuInitial extends StartInkuState {}

final class UpdateIdInku extends StartInkuState{
  List<String> listInkubators;
  
  UpdateIdInku({required this.listInkubators});
}