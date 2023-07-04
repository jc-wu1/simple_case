import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeStarted>(_onHomeStarted);
  }

  FutureOr<void> _onHomeStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadInProgress());

    await Future.delayed(const Duration(seconds: 10), () {
      emit(const HomeLoadSuccess('OK'));
    });
  }
}
