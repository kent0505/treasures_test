import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/coins_count_card.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/reward_dialog.dart';
import '../../reward/bloc/reward_bloc.dart';
import '../widgets/roulette_item.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({super.key});

  @override
  State<RoulettePage> createState() => _RoulettePageState();
}

class _RoulettePageState extends State<RoulettePage> {
  double turns = 0.0;
  double angle = 0;
  String asset = '';

  List<double> angles = [
    8, // 20
    12, // 50
    26, // 0
    30, // -50
    16, // 50
    18, // 0
    26, // 0
    30, // -50
    34, // 0
    36, // 100
    38, // 1000
    30, // -50
    26, // 0
    44, // 20
    47, // 70 icon 4
    48, // 30 icon 2
    65, // 200 icon 6
  ];

  int getCoins() {
    asset = '';
    if (angle == 8) return 20;
    if (angle == 12) {
      asset = 'item3';
      return 50;
    }
    if (angle == 16) return 50;
    if (angle == 18) return 0;
    if (angle == 26) return 0;
    if (angle == 30) {
      asset = 'item1';
      return -50;
    }
    if (angle == 34) return 0;
    if (angle == 36) return 100;
    if (angle == 38) return 1000;
    if (angle == 44) return 20;
    if (angle == 47) {
      asset = 'item4';
      return 70;
    }
    if (angle == 48) {
      asset = 'item2';
      return 30;
    }
    if (angle == 65) {
      asset = 'item6';
      return 200;
    }
    return 0;
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        print(angle);
      });
    });
  }

  void onSpin() async {
    await minusCoins(10).then((value) {
      context.read<RewardBloc>().add(GetCoinsEvent());
      setState(() {
        turns += 5 / 1;
      });
      getRandom();
      Future.delayed(const Duration(seconds: 7), () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return RewardDialog(
              title: 'Your winnings',
              reward: getCoins().toString(),
              asset: asset,
              onPressed: () async {
                await plusCoins(getCoins()).then((value) {
                  context.read<RewardBloc>().add(GetCoinsEvent());
                  context.pop();
                });
              },
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 10 + statusBar(context)),
                Stack(
                  children: [
                    Transform.rotate(
                      angle: angle,
                      child: AnimatedRotation(
                        turns: turns,
                        curve: Curves.easeInOutCirc,
                        duration: const Duration(seconds: 6),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/roulette.svg'),
                            const RouletteItem(
                              item: 1,
                              degree: 170,
                              top: 42,
                              left: 104,
                            ),
                            const RouletteItem(
                              item: 2,
                              degree: 170,
                              right: 64,
                              top: 63,
                            ),
                            const RouletteItem(
                              item: 3,
                              degree: 80,
                              left: 54,
                              top: 79,
                            ),
                            const RouletteItem(
                              item: 4,
                              degree: -145,
                              right: 38,
                              top: 120,
                            ),
                            const RouletteItem(
                              item: 5,
                              degree: -23,
                              bottom: 44,
                              left: 94,
                            ),
                            const RouletteItem(
                              item: 6,
                              degree: -74,
                              right: 68,
                              bottom: 48,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 1,
                      child: SvgPicture.asset('assets/arrow.svg'),
                    ),
                  ],
                ),
                const Spacer(),
                PrimaryButton(
                  title: 'Spin (10 coins)',
                  width: 200,
                  onPressed: onSpin,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          const Positioned(
            right: 62,
            bottom: 32,
            child: Column(
              children: [
                Text(
                  'Total Coins',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 20,
                    fontFamily: Fonts.inter,
                  ),
                ),
                SizedBox(height: 8),
                CoinsCountCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
