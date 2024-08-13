import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'buttons/ico_button.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.bg = 1,
    this.back = false,
  });

  final Widget body;
  final int bg;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(color: const Color(0xff111111)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg$bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff131313).withOpacity(0),
                  const Color(0xff131313).withOpacity(0.6),
                  const Color(0xff131313),
                ],
              ),
            ),
          ),
          body,
          if (back)
            Positioned(
              top: 32,
              left: 62,
              child: IcoButton(
                asset: 'back',
                onPressed: () {
                  context.pop();
                },
              ),
            ),
        ],
      ),
    );
  }
}
