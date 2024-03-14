import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakers_animation/onboarding/onboarding_screen.dart';
import 'package:sneakers_animation/screens/home_screen.dart';
import 'package:sneakers_animation/screens/shoe_screen.dart';

import 'core/animation/page_transition.dart';
import 'core/theme/app_theme.dart';
import 'data/model/shoe.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnBoardingScreen(),
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          'home' => NoAnimationTransition(
              builder: (context) => const HomeScreen(),
            ),
          'shoe_details' => NoAnimationTransition(
              builder: (context) =>
                  ShoeScreen(shoe: settings.arguments as Shoe),
            ),
          _ => NoAnimationTransition(builder: (context) => const HomeScreen())
        };
      },
      theme: mainTheme,
      darkTheme: mainTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
