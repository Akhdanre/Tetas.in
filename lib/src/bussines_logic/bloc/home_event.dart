part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class InitialDataRequest extends HomeEvent {}

final class UpdateDataRequest extends HomeEvent {}
