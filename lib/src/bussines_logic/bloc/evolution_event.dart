part of 'evolution_bloc.dart';

class EvolutionEvent {}

final class EvolutionProgressEvent extends EvolutionEvent {
  int day;

  EvolutionProgressEvent({required this.day});
}

final class EvolutionProgressSwitchEvent extends EvolutionEvent {
  int day;

  EvolutionProgressSwitchEvent({required this.day});
}
