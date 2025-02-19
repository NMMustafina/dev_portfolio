import 'package:dev_portfolio/coffee_app/coffee_app.dart';
import 'package:dev_portfolio/fitness_app/fitness_app.dart';
import 'package:flutter/material.dart';

import '../../coffee_app/theme/coffee_theme.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CoffeeTheme().themeData,
      child: Scaffold(
        appBar: AppBar(title: Text("Navigator")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoffeeApp()),
                ),
                child: Text("Go to Coffee App"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FitnessApp()),
                ),
                child: Text("Go to Fitness App"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
