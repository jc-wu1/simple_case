part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final String msg;

  const HomeLoadSuccess(this.msg);

  @override
  List<Object> get props => [msg];
}

class HomeLoadFailure extends HomeState {}
