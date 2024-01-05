part of 'base_screen_cubit.dart';

@immutable
abstract class BaseScreenState {}

class BaseScreenInitial extends BaseScreenState {}

class ChangePage extends BaseScreenCubit {
  int page;

  ChangePage({required this.page});
}
