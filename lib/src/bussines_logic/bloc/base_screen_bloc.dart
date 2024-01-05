import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_screen_event.dart';

part 'base_screen_state.dart';

class BaseScreenBloc extends Bloc<BaseScreenEvent, BaseScreenState> {
  BaseScreenBloc() : super(BaseScreenInitial()) {
    on<ChangePage>((event, emit) => emit(SuccessChangePage(event.page)));
  }

  
  void onInitBloc() {}

}
