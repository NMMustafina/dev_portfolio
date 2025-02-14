import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FitnessHomeScreen extends StatefulWidget {
  const FitnessHomeScreen({super.key});

  @override
  State<FitnessHomeScreen> createState() => _FitnessHomeScreenState();
}

class _FitnessHomeScreenState extends State<FitnessHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B6F0),
      appBar: AppBar(title: Text("Fitness App Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Fitness App Home Page!"),
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
