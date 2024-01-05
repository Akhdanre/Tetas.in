part of 'base_screen_bloc.dart';

@immutable
abstract class BaseScreenEvent {}

class ChangePage extends BaseScreenEvent {
  final int page;

  ChangePage({required this.page});
}
