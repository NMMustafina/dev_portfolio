import 'package:dev_portfolio/fitness_app/theme/fitness_theme.dart';
import 'package:dev_portfolio/navigator/view/navigator_screen.dart';
import 'package:flutter/material.dart';

class FitnessHomeScreen extends StatefulWidget {
  const FitnessHomeScreen({super.key});

  @override
  State<FitnessHomeScreen> createState() => _FitnessHomeScreenState();
}

class _FitnessHomeScreenState extends State<FitnessHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FitnessTheme.lightTheme,
      child: Scaffold(
        appBar: AppBar(title: Text("Fitness App Home")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Fitness App Home Page!"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavigatorScreen()),
                    (route) => false,
                  );
                },
                child: Text("Go to Main Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
