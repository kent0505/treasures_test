import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/reward/bloc/reward_bloc.dart';
import '../../config/app_colors.dart';
import '../../utils.dart';

class RewardDialog extends StatelessWidget {
  const RewardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: 200,
            width: 222,
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: AppColors.secondary,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Your reward\ntoday ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 24,
                    fontFamily: Fonts.sancreek,
                  ),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/coin.png',
                  width: 67,
                ),
                const Spacer(),
                Text(
                  getReward().toString(),
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            height: 64,
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: AppColors.secondary,
              ),
            ),
            child: CupertinoButton(
              onPressed: () async {
                claimCoins();
                context.read<RewardBloc>().add(GetCoinsEvent());
                context.pop();
              },
              padding: EdgeInsets.zero,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Done',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 20,
                      fontFamily: Fonts.inter,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
