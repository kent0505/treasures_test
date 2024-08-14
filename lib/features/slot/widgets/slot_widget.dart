import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class SlotWidget extends StatelessWidget {
  const SlotWidget({
    super.key,
    required this.childrens,
    required this.top,
  });

  final List<Widget> childrens;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      width: 144,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: AppColors.secondary,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            // top: -1600,
            top: top,
            left: 0,
            right: 0,
            child: Column(children: childrens),
          ),
        ],
      ),
    );
  }
}
