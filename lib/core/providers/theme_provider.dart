import 'package:flutter/material.dart';
import 'package:phayarsar/core/utils/perf/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    return _getCurrentTheme();
  }

  ThemeMode _getCurrentTheme() {
    final theme = ref.read(preferencesProvider).getTheme();
    switch (theme) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    state = themeMode;
    await ref.read(preferencesProvider).saveTheme(themeMode);
  }
}
