part of 'home_bloc.dart';

abstract class HomeEvent {}

class PlayEvent extends HomeEvent {
  final bool exit;
  PlayEvent({this.exit = false});
}
