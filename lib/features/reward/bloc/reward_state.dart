part of 'reward_bloc.dart';

abstract class RewardState {}

class RewardInitial extends RewardState {}

class CoinsLoadedState extends RewardState {
  final int coins;
  CoinsLoadedState({required this.coins});
}
