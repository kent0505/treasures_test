import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';

class IcoButton extends StatelessWidget {
  const IcoButton({
    super.key,
    required this.asset,
    this.onPressed,
  });

  final String asset;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 48,
        width: 48,
        margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: AppColors.secondary,
          ),
        ),
        child: Center(
          child: SvgPicture.asset('assets/$asset.svg'),
        ),
      ),
    );
  }
}
