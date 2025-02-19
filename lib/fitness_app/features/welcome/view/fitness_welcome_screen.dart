import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/fitness_app/theme/fitness_theme.dart';
import 'package:dev_portfolio/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FitnessWelcomeScreen extends StatelessWidget {
  const FitnessWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FitnessTheme.lightTheme,
      child: Scaffold(
        appBar: AppBar(title: Text("Fitness Welcome Screen")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Fitness Welcome Screen"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.router.push(const FitnessHomeRoute()),
                child: Text("Go to Home Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
