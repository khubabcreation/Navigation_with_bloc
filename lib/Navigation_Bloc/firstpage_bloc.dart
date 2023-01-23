import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'firstpage_event.dart';

part 'firstpage_state.dart';

class FirstpageBloc extends Bloc<FirstpageEvent, FirstpageState> {
  FirstpageBloc() : super(FirstpageInitial()) {
    on<gotoNext>((event, emit) {
      try {
        emit.call(FirstpageLoadingState());
        emit.call(FirstpageLoadedState());
      } catch (e) {
        emit.call(FirstpageErrorState(errormsg: e.toString()));
      }
    });
  }
}
