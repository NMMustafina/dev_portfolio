import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/router/router.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CoffeeWelcomeScreen extends StatelessWidget {
  const CoffeeWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
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
                      const Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.sora,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.sora,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA2A2A2),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              context.router.push(const CoffeeHomeRoute()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: FontFamily.sora,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
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
