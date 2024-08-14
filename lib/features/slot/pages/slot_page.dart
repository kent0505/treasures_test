import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/coins_count_card.dart';
import '../../../core/widgets/dialogs/reward_dialog.dart';
import '../../reward/bloc/reward_bloc.dart';
import '../widgets/change_amount.dart';
import '../widgets/slot_item.dart';
import '../widgets/slot_widget.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({super.key});

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  int seconds = 2;
  int amount = 10;
  double top = 0;
  String asset = 'coin';
  bool win = false;
  bool active = true;

  List<String> slotAssets = ['coin', 'slot1', 'slot2', 'slot3'];

  bool getWinOrLoose() {
    Random random = Random();
    bool win = random.nextBool();
    print(win);
    return win;
  }

  void changeAsset() {
    Random random = Random();
    asset = slotAssets[random.nextInt(slotAssets.length)];
  }

  String getRandomAsset() {
    Random random = Random();
    return slotAssets[random.nextInt(slotAssets.length)];
  }

  void onChangeAmount(bool plus) {
    setState(() {
      if (plus) {
        if (amount <= 90) amount = amount + 10;
      } else {
        if (amount >= 20) amount = amount - 10;
      }
    });
  }

  void onSpin() async {
    if (active == false) return;
    active = false;
    win = getWinOrLoose();
    String topAsset1 = getRandomAsset();
    String topAsset2 = getRandomAsset();
    String topAsset3 = getRandomAsset();
    String topAsset4 = getRandomAsset();
    String bottomAsset1 = getRandomAsset();
    String bottomAsset2 = getRandomAsset();
    String bottomAsset3 = getRandomAsset();
    String bottomAsset4 = getRandomAsset();
    String midle1 = getRandomAsset();
    String midle2 = getRandomAsset();
    String midle3 = getRandomAsset();
    String midle4 = getRandomAsset();

    await minusCoins(amount).then((value) {
      setState(() {
        if (win) {
          changeAsset();
          childrens1.insert(0, SlotItem(asset: topAsset1));
          childrens1.insert(0, SlotItem(asset: asset));
          childrens1.insert(0, SlotItem(asset: bottomAsset1));
          childrens2.insert(0, SlotItem(asset: topAsset2));
          childrens2.insert(0, SlotItem(asset: asset));
          childrens2.insert(0, SlotItem(asset: bottomAsset2));
          childrens3.insert(0, SlotItem(asset: topAsset3));
          childrens3.insert(0, SlotItem(asset: asset));
          childrens3.insert(0, SlotItem(asset: bottomAsset3));
          childrens4.insert(0, SlotItem(asset: topAsset4));
          childrens4.insert(0, SlotItem(asset: asset));
          childrens4.insert(0, SlotItem(asset: bottomAsset4));
        } else {
          childrens1.insert(0, SlotItem(asset: topAsset1));
          childrens1.insert(0, SlotItem(asset: midle1));
          childrens1.insert(0, SlotItem(asset: bottomAsset1));
          childrens2.insert(0, SlotItem(asset: topAsset2));
          childrens2.insert(0, SlotItem(asset: midle2));
          childrens2.insert(0, SlotItem(asset: bottomAsset2));
          childrens3.insert(0, SlotItem(asset: topAsset3));
          childrens3.insert(0, SlotItem(asset: midle3));
          childrens3.insert(0, SlotItem(asset: bottomAsset3));
          childrens4.insert(0, SlotItem(asset: topAsset4));
          childrens4.insert(0, SlotItem(asset: midle4));
          childrens4.insert(0, SlotItem(asset: bottomAsset4));
        }
        print(asset);
        context.read<RewardBloc>().add(GetCoinsEvent());
        seconds = 2;
        top = top - 222 * 12;
      });
    });
    try {
      await Future.delayed(const Duration(milliseconds: 2500), () {
        if (win) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return RewardDialog(
                title: 'Your winnings',
                reward: (amount * 2).toString(),
                onPressed: () async {
                  await plusCoins(amount * 2).then((value) {
                    context.read<RewardBloc>().add(GetCoinsEvent());
                    context.pop();
                  });
                },
              );
            },
          );
        }
        setState(() {
          childrens1.shuffle();
          childrens2.shuffle();
          childrens3.shuffle();
          childrens4.shuffle();
          childrens1.removeLast();
          childrens1.removeLast();
          childrens1.removeLast();
          childrens1.removeLast();
          childrens1.removeLast();
          childrens1.removeLast();
          childrens2.removeLast();
          childrens2.removeLast();
          childrens2.removeLast();
          childrens2.removeLast();
          childrens2.removeLast();
          childrens2.removeLast();
          childrens3.removeLast();
          childrens3.removeLast();
          childrens3.removeLast();
          childrens3.removeLast();
          childrens3.removeLast();
          childrens3.removeLast();
          childrens4.removeLast();
          childrens4.removeLast();
          childrens4.removeLast();
          childrens4.removeLast();
          childrens4.removeLast();
          childrens4.removeLast();

          if (win) {
            childrens1.add(SlotItem(asset: bottomAsset1));
            childrens1.add(SlotItem(asset: asset));
            childrens1.add(SlotItem(asset: topAsset1));
            childrens2.add(SlotItem(asset: bottomAsset2));
            childrens2.add(SlotItem(asset: asset));
            childrens2.add(SlotItem(asset: topAsset2));
            childrens3.add(SlotItem(asset: bottomAsset3));
            childrens3.add(SlotItem(asset: asset));
            childrens3.add(SlotItem(asset: topAsset3));
            childrens4.add(SlotItem(asset: bottomAsset4));
            childrens4.add(SlotItem(asset: asset));
            childrens4.add(SlotItem(asset: topAsset4));
          } else {
            childrens1.add(SlotItem(asset: bottomAsset1));
            childrens1.add(SlotItem(asset: midle1));
            childrens1.add(SlotItem(asset: topAsset1));
            childrens2.add(SlotItem(asset: bottomAsset2));
            childrens2.add(SlotItem(asset: midle2));
            childrens2.add(SlotItem(asset: topAsset2));
            childrens3.add(SlotItem(asset: bottomAsset3));
            childrens3.add(SlotItem(asset: midle3));
            childrens3.add(SlotItem(asset: topAsset3));
            childrens4.add(SlotItem(asset: bottomAsset4));
            childrens4.add(SlotItem(asset: midle4));
            childrens4.add(SlotItem(asset: topAsset4));
          }
          top = 0;
          seconds = 0;
          active = true;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  List<Widget> childrens1 = [
    ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  ];
  List<Widget> childrens2 = [
    ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  ];

  List<Widget> childrens3 = [
    ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  ];

  List<Widget> childrens4 = [
    ...List.generate(9, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(9, (index) => const SlotItem(asset: 'slot3')),
  ];

  @override
  void initState() {
    super.initState();
    childrens1.shuffle();
    childrens2.shuffle();
    childrens3.shuffle();
    childrens4.shuffle();

    childrens1.shuffle();
    childrens2.shuffle();
    childrens3.shuffle();
    childrens4.shuffle();

    childrens1.shuffle();
    childrens2.shuffle();
    childrens3.shuffle();
    childrens4.shuffle();

    childrens1.shuffle();
    childrens2.shuffle();
    childrens3.shuffle();
    childrens4.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 32 + statusBar(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlotWidget(
                childrens: childrens1,
                seconds: seconds,
                top: top,
                left: true,
              ),
              SlotWidget(
                childrens: childrens2,
                seconds: seconds,
                top: top,
              ),
              SlotWidget(
                childrens: childrens3,
                seconds: seconds,
                top: top,
              ),
              SlotWidget(
                childrens: childrens4,
                seconds: seconds,
                top: top,
                right: true,
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 62),
              ChangeAmount(
                amount: amount,
                onPressed: onChangeAmount,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Spin',
                width: 200,
                onPressed: onSpin,
              ),
              const SizedBox(width: 10),
              PrimaryButton(
                title: 'To main',
                width: 117,
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(width: 20),
              const Column(
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
              const SizedBox(width: 62),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
