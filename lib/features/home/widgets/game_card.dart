import 'package:flutter/material.dart';
import 'package:treasures_test/core/widgets/buttons/primary_button.dart';

import '../../../core/config/app_colors.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.title,
    required this.asset,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273,
      width: 144,
      padding: const EdgeInsets.symmetric(horizontal: 18),
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
          const SizedBox(height: 24),
          Image.asset(
            'assets/$asset.png',
            width: double.infinity,
          ),
          const SizedBox(height: 13),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 24,
              fontFamily: Fonts.sancreek,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            title: 'Play',
            asset: 'play',
            onPressed: onPressed,
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }
}
