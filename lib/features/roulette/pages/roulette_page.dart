import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';

class RoulettePage extends StatelessWidget {
  const RoulettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20 + statusBar(context)),
            Stack(
              children: [
                SvgPicture.asset('assets/roulette2.svg'),
                SvgPicture.asset('assets/bets.svg'),
              ],
            ),
            const SizedBox(height: 13),
            PrimaryButton(
              title: 'Spin (10 coins)',
              width: 200,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
