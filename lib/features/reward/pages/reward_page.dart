import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/reward_dialog.dart';
import '../widgets/reward_card.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  void onClaim() {
    if (canClaim) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const RewardDialog();
        },
      );
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bg: 3,
      back: true,
      body: Column(
        children: [
          SizedBox(height: 36 + statusBar(context)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RewardCard(day: 1, amount: 100),
              SizedBox(width: 8),
              RewardCard(day: 2, amount: 300),
              SizedBox(width: 8),
              RewardCard(day: 3, amount: 500),
              SizedBox(width: 8),
              RewardCard(day: 4, amount: 1000),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RewardCard(day: 5, amount: 2000),
              SizedBox(width: 8),
              RewardCard(day: 6, amount: 5000),
              SizedBox(width: 8),
              RewardCard(day: 7, amount: 10000),
              SizedBox(width: 8),
              RewardCard(day: 8, amount: 15000),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            title: canClaim ? 'Get daily reward' : 'Come back tomorrow',
            width: canClaim ? 200 : 250,
            onPressed: onClaim,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
