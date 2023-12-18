import 'package:bloc/bloc.dart';
import 'package:tetas_in/src/utils/shared_preferences/inku_data.dart';

part 'evolution_event.dart';
part 'evolution_state.dart';

class EvolutionBloc extends Bloc<EvolutionEvent, EvolutionState> {
  EvolutionBloc() : super(EvolutionInitial()) {
    on<EvolutionProgressEvent>((event, emit) {
      emit(EvolutioanProgress(day: event.day));
    });

    on<EvolutionProgressSwitchEvent>((event, emit) {
      emit(EvolutionProgressSwitch(day: event.day));
    });

    getEvolutionProgress();
  }

  getEvolutionProgress() async {
    int day = await InkuData().day;
    add(EvolutionProgressEvent(day: day));
  }

  evolutionProgress(int day) async {
    add(EvolutionProgressSwitchEvent(day: day));
  }
}
