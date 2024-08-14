import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/ico_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/home_bloc.dart';
import '../../../core/widgets/coins_count_card.dart';
import '../widgets/daily_reward_button.dart';
import '../widgets/game_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();
  bool playing = false;

  void onSound() {
    setState(() {
      if (playing) {
        player.pause();
        playing = false;
      } else {
        player.play(AssetSource('sound.mp3'));
        player.setReleaseMode(ReleaseMode.loop);
        playing = true;
      }
    });
  }

  void onSettings() {
    context.push('/settings');
  }

  void onSlot() {
    context.push('/slot');
  }

  void onRoulette() {
    context.push('/roulette');
  }

  void onPlay() {
    context.read<HomeBloc>().add(PlayEvent());
  }

  void onExit() {
    context.read<HomeBloc>().add(PlayEvent(exit: true));
    // SystemNavigator.pop();
  }

  @override
  void initState() {
    super.initState();
    // onSound();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 32 + statusBar(context),
          bottom: 32,
          left: 62,
          right: 32,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 157,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is StartState) return const CoinsCountCard();
                      return Container();
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IcoButton(
                        asset: playing ? 'sound1' : 'sound2',
                        onPressed: onSound,
                      ),
                      const SizedBox(width: 8),
                      IcoButton(
                        asset: 'settings',
                        onPressed: onSettings,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is StartState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          GameCard(
                            title: 'Slot',
                            asset: 'slot',
                            onPressed: onSlot,
                          ),
                          const SizedBox(width: 24),
                          GameCard(
                            title: 'Roulette',
                            asset: 'spinner',
                            onPressed: onRoulette,
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    const Spacer(flex: 3),
                    const Center(
                      child: Text(
                        'Treasures of the\nEastern Emperors',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 36,
                          fontFamily: Fonts.sancreek,
                        ),
                      ),
                    ),
                    const Spacer(),
                    PrimaryButton(
                      title: 'Play',
                      asset: 'play',
                      width: 110,
                      onPressed: onPlay,
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: 187,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is StartState) return const DailyRewardButton();
                      return Container();
                    },
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title: 'Exit',
                    asset: 'exit',
                    height: 56,
                    width: 117,
                    onPressed: onExit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
