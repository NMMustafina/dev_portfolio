import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CoffeeHomeScreen extends StatelessWidget {
  const CoffeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC67C4E),
      appBar: AppBar(title: Text("Coffee Shop Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Coffee Shop!"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.pushAndPopUntil(
                  const NavigatorRoute(),
                  predicate: (route) => false,
                );
              },
              child: Text("Go to Main Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
