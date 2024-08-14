import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import '../../features/reward/bloc/reward_bloc.dart';

class CoinsCountCard extends StatelessWidget {
  const CoinsCountCard({
    super.key,
    this.height = 56,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 127,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: AppColors.secondary,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Image.asset(
            'assets/coin.png',
            height: 32,
          ),
          const SizedBox(width: 8),
          BlocBuilder<RewardBloc, RewardState>(
            builder: (context, state) {
              return Expanded(
                child: Text(
                  coins.toString(),
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 20,
                    fontFamily: Fonts.inter,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
