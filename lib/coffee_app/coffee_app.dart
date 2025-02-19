import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:flutter/material.dart';

import 'features/welcome/view/coffee_welcome_screen.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CoffeeTheme().themeData,
      home: const CoffeeWelcomeScreen(),
    );
  }
}
