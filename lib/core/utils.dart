import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int coins = 100;
int day = 1;
int timestamp = 0;
bool canClaim = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('timestamp');
  await prefs.remove('day');
  await prefs.remove('coins');
  await prefs.remove('canClaim');
  coins = prefs.getInt('coins') ?? 100;
  day = prefs.getInt('day') ?? 1;
  timestamp = prefs.getInt('timestamp') ?? 0;
  canClaim = prefs.getBool('canClaim') ?? true;

  DateTime claimedDate = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  DateTime now = DateTime.now();

  if (now.day > claimedDate.day) canClaim = true;

  log(claimedDate.day.toString());
  log(now.day.toString());
  log('COINS = $coins');
  log('DAY = $day');
}

Future<void> claimCoins() async {
  final prefs = await SharedPreferences.getInstance();
  timestamp = getCurrentTimestamp();
  coins = coins + getReward();
  canClaim = false;
  prefs.setInt('coins', coins);
  prefs.setInt('timestamp', timestamp);
  prefs.setBool('canClaim', false);
  if (day == 8) {
    day = 1;
  } else {
    day = day + 1;
  }
  prefs.setInt('day', day);
}

Future<void> minusCoins(int amount) async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins - amount;
  prefs.setInt('coins', coins);
}

Future<void> plusCoins(int amount) async {
  final prefs = await SharedPreferences.getInstance();
  coins = coins + amount;
  prefs.setInt('coins', coins);
}

int getReward() {
  if (day == 1) return 100;
  if (day == 2) return 300;
  if (day == 3) return 500;
  if (day == 4) return 1000;
  if (day == 5) return 2000;
  if (day == 6) return 5000;
  if (day == 7) return 10000;
  if (day == 8) return 15000;
  return 100;
}

bool getRewarded(int data) {
  if (data < day) {
    return true;
  } else {
    return false;
  }
}

double statusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

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
