import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.asset = '',
    this.height = 64,
    this.width = 250,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final double height;
  final double width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: AppColors.secondary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (asset.isNotEmpty) ...[
              SvgPicture.asset('assets/$asset.svg'),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: const TextStyle(
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
