import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/coins_count_card.dart';
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
  int amount = 10;
  double top = 0;

  void onChangeAmount(bool plus) {
    setState(() {
      if (plus) {
        if (amount <= coins - 10) amount = amount + 10;
      } else {
        if (amount >= 20) amount = amount - 10;
      }
    });
  }

  void onSpin() async {
    await minusCoins(amount).then((value) {
      context.read<RewardBloc>().add(GetCoinsEvent());
      setState(() {
        top = top - 222 * 12;
      });
    });
  }

  List<Widget> childrens1 = [
    ...List.generate(25, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot3')),
  ];
  List<Widget> childrens2 = [
    ...List.generate(25, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot3')),
  ];

  List<Widget> childrens3 = [
    ...List.generate(25, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot3')),
  ];

  List<Widget> childrens4 = [
    ...List.generate(25, (index) => const SlotItem(asset: 'coin')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot1')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot2')),
    ...List.generate(25, (index) => const SlotItem(asset: 'slot3')),
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
              SlotWidget(childrens: childrens1, top: top, left: true),
              SlotWidget(childrens: childrens2, top: top),
              SlotWidget(childrens: childrens3, top: top),
              SlotWidget(childrens: childrens4, top: top, right: true),
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
