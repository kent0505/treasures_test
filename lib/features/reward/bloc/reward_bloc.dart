import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';

part 'reward_event.dart';
part 'reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  RewardBloc() : super(RewardInitial()) {
    on<GetCoinsEvent>((event, emit) {
      emit(CoinsLoadedState(coins: coins));
    });
  }
}
