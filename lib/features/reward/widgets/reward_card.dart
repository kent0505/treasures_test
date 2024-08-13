import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.day,
    required this.amount,
  });

  final int day;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: 104,
      decoration: BoxDecoration(
        color: getRewarded(day) ? AppColors.secondary : AppColors.main,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: AppColors.secondary,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(
            'Day $day',
            style: TextStyle(
              color: getRewarded(day) ? AppColors.main : AppColors.secondary,
              fontSize: 14,
              fontFamily: Fonts.inter,
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            'assets/coin.png',
            height: 32,
          ),
          const Spacer(),
          Text(
            amount.toString(),
            style: TextStyle(
              color: getRewarded(day) ? AppColors.main : AppColors.secondary,
              fontSize: 14,
              fontFamily: Fonts.inter,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
