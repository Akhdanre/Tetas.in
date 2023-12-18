part of 'evolution_bloc.dart';

class EvolutionState {}

final class EvolutionInitial extends EvolutionState {}

final class EvolutioanProgress extends EvolutionState {
  int day;

  EvolutioanProgress({required this.day});
}

final class EvolutionProgressSwitch extends EvolutionState {
  int day;

  EvolutionProgressSwitch({required this.day});
}
