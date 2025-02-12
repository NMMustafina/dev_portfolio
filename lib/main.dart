import 'package:flutter/material.dart';
import 'package:dev_portfolio/src/generated/assets.gen.dart';
import 'package:dev_portfolio/src/generated/fonts.gen.dart';

void main() {
  runApp(const FitBalanceApp());
}

class FitBalanceApp extends StatelessWidget {
  const FitBalanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Assets.coffeeShop.images.onboardingBg.image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.all(24),
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
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
