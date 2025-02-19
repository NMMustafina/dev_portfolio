import 'package:dev_portfolio/coffee_app/features/features.dart';
import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

class CoffeeWelcomeScreen extends StatelessWidget {
  const CoffeeWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CoffeeTheme.darkBackgroundColor,
      body: Stack(
        children: [
          Assets.coffeeApp.images.welcomeBg.image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoffeeHomeScreen(),
                            ),
                          ),
                          style: theme.elevatedButtonTheme.style,
                          child: const Text(
                            'Get Started',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
