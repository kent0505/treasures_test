import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/reward/pages/reward_page.dart';
import '../../features/roulette/pages/roulette_page.dart';
import '../../features/slot/pages/slot_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      onExit: (context, state) => false,
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/reward',
      builder: (context, state) => const RewardPage(),
    ),
    GoRoute(
      path: '/slot',
      builder: (context, state) => const SlotPage(),
    ),
    GoRoute(
      path: '/roulette',
      builder: (context, state) => const RoulettePage(),
    ),
  ],
);
