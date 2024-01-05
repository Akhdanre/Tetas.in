part of 'base_screen_bloc.dart';

abstract class BaseScreenState {}

class BaseScreenInitial extends BaseScreenState {
  final int page = 0;
}

class SuccessChangePage extends BaseScreenState {
  int page;

  SuccessChangePage(this.page);
}
