import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

@riverpod
SharedPreferences sharedPreference(SharedPreferenceRef ref) {
  throw UnimplementedError();
}

@riverpod
Preferences preferences(PreferencesRef ref) {
  final sharedPreferences = ref.read(sharedPreferenceProvider);
  return Preferences(sharedPreferences);
}

class Preferences {
  final SharedPreferences sharedPreferences;
  final _themeModeKey = 'themeMode';

  const Preferences(this.sharedPreferences);

  Future<void> saveTheme(ThemeMode themeMode) async {
    await sharedPreferences.setString(_themeModeKey, themeMode.name);
    debugPrint('Success $themeMode ${themeMode.name}');
  }

  String? getTheme() => sharedPreferences.getString(_themeModeKey);
}
