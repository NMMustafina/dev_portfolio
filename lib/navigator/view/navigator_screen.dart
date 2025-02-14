import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(const CoffeeWelcomeRoute()),
              child: Text("Go to Coffee App"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.router.push(const FitnessWelcomeRoute()),
              child: Text("Go to Fitness App"),
            ),
          ],
        ),
      ),
    );
  }
}
