import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class RewardDialog extends StatelessWidget {
  const RewardDialog({
    super.key,
    required this.title,
    required this.reward,
    this.asset = 'coin',
    required this.onPressed,
  });

  final String title;
  final String reward;
  final String asset;
  final void Function() onPressed;

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
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 24,
                    fontFamily: Fonts.sancreek,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  asset.isEmpty ? 'assets/coin.png' : 'assets/$asset.png',
                  width: 67,
                ),
                const Spacer(),
                Text(
                  reward,
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
              onPressed: onPressed,
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
