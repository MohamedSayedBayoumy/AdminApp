import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:untitled87/bloc/SelectChoose_bloc/seclect_choose_event.dart';
import 'package:untitled87/bloc/SelectChoose_bloc/select-choose_state.dart';







class SelectChooseBloc extends Bloc<SelectChooseEvent, SelectChooseState> {
  SelectChooseBloc() : super(SelectChooseInitial()) {
    on<choose>(_choose);
  }

  FutureOr<void> _choose(choose event, Emitter<SelectChooseState> emit) {
    if (event is choose) {
      if (event.value is String) {
        emit(Loading());
        print('hi 1 : ${event.value}');
        state.SelectChoose = event.value ;
        print('hi 2 : ${state.SelectChoose}');
        emit(Success(value: event.value));
      }
    }
  }
}
