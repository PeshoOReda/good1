import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app_c12_offline/config/theme/my_theme.dart';
import 'package:quran_app_c12_offline/presentation/home/home_screen.dart';
import 'package:quran_app_c12_offline/presentation/home/tabs/hadith_tab/hadith_details/hadith_details.dart';
import 'package:quran_app_c12_offline/presentation/home/tabs/quran_tab/quran_details/quran_details_screen.dart';
import 'package:quran_app_c12_offline/presentation/splash/splash_screen.dart';

import '../core/utils/routes_manager.dart';
import '../provider/settings_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        routes: {
          RoutesManager.hadithDetailsRoute: (_) => const HadithDetails(),
          RoutesManager.homeRoute: (_) => const HomeScreen(),
          RoutesManager.splashRoute: (_) => const SplashScreen(),
          RoutesManager.quranDetailsRoute: (_) => const QuranDetailsScreen(),
        },
        initialRoute: RoutesManager.splashRoute,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: provider.currentTheme);
  }
}
