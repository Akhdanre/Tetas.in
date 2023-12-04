part of 'controller_bloc.dart';

abstract class ControllerState {}

final class ControllerInitial extends ControllerState {}

final class ControllerSuccess extends ControllerState {}

final class ControllerError extends ControllerState {}
