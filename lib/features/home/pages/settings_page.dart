import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      bg: 2,
      body: Column(
        children: [
          SizedBox(height: 32 + statusBar(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/sword1.svg'),
              const SizedBox(width: 8),
              SvgPicture.asset('assets/lotus.svg'),
              const SizedBox(width: 8),
              SvgPicture.asset('assets/sword2.svg'),
            ],
          ),
          const Text(
            'Settings',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 36,
              fontFamily: Fonts.sancreek,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            title: 'Share with friends',
            height: 56,
            width: 240,
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          PrimaryButton(
            title: 'Privacy Policy',
            height: 56,
            width: 240,
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          PrimaryButton(
            title: 'Terms of use',
            height: 56,
            width: 240,
            onPressed: () {},
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
