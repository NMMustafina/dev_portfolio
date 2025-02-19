import 'package:dev_portfolio/fitness_app/features/features.dart';
import 'package:dev_portfolio/fitness_app/theme/fitness_theme.dart';
import 'package:flutter/material.dart';

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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FitnessHomeScreen()),
                ),
                child: Text("Go to Home Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
