import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phayarsar/core/screens/not_found_screen.dart';
import 'package:phayarsar/features/phayarsar/domain/phayarsar_subtitle.dart';
import 'package:phayarsar/features/phayarsar/presentation/detial_screen.dart';
import 'package:phayarsar/features/phayarsar/presentation/home_screen.dart';
import 'package:phayarsar/features/phayarsar/presentation/subtitle_screen.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum AppRoutes {
  home,
  subTitle,
  detail,
}

final _navigatorkey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: _navigatorkey,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRoutes.home.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.subTitle.name,
        path: '/:title',
        builder: (context, state) => SubTitleScreen(
          title: state.pathParameters['title'] as String,
          phayarsarSubTitleList: state.extra as List<PhayarsarSubTitle>,
        ),
      ),
      GoRoute(
        name: AppRoutes.detail.name,
        path: '/:groupId/:id',
        builder: (context, state) => PhayarsarDetailScreen(
          groupId: state.pathParameters['groupId'] as String,
          id: state.pathParameters['id'] as String,
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    debugLogDiagnostics: true,
  );
}
