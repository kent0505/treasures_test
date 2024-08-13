import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<PlayEvent>((event, emit) {
      if (event.exit) {
        emit(HomeInitial());
      } else {
        emit(StartState());
      }
    });
  }
}
