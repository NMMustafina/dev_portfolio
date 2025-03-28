import 'package:flutter/material.dart';

import 'navigator/view/navigator_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
