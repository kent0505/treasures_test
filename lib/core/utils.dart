import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int coins = 0;

final List<String> assets = [
  'assets/bg1.jpg',
  'assets/bg2.jpg',
  'assets/bg3.jpg',
  'assets/coin.png',
  'assets/chest.png',
  'assets/slot.png',
  'assets/spinner.png',
];

void precache(BuildContext context) async {
  for (String asset in assets) {
    await precacheImage(AssetImage(asset), context);
  }
}

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  coins = prefs.getInt('coins') ?? 0;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

double statusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}
