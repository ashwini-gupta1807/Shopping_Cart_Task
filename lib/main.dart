import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/utils/constants/app_colors.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable edge-to-edge display
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Set initial system UI overlay style immediately
  _setSystemUIOverlayStyle();

  runApp(ProviderScope(child: const MyApp()));
}

void _setSystemUIOverlayStyle() {
  // Get system brightness early
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Always transparent for edge-to-edge
      statusBarIconBrightness: brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      statusBarBrightness: brightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light, // For iOS
      systemNavigationBarColor: brightness == Brightness.dark
          ? AppColors.black
          : AppColors.white,
      systemNavigationBarIconBrightness: brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ),
  );
}
