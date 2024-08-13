import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';

class DailyRewardButton extends StatelessWidget {
  const DailyRewardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/reward');
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 56,
        width: 187,
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
              'assets/chest.png',
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text(
              'Daily reward',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 20,
                fontFamily: Fonts.inter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
