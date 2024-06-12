import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phayarsar/core/providers/theme_provider.dart';
import 'package:phayarsar/core/routes/router.dart';
import 'package:phayarsar/core/themes/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:phayarsar/core/utils/perf/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // remove # in url
  usePathUrlStrategy();

  // For Unexpected Error
  ErrorWidget.builder = (details) {
    return Text('Error\n${details.exception}');
  };

  // Run App
  final sharedPreference = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferenceProvider.overrideWithValue(sharedPreference),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Phayarsar',
      debugShowCheckedModeBanner: kDebugMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeControllerProvider),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
