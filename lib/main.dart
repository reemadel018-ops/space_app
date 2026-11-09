import 'package:flutter/material.dart';
import 'package:space_app/core/app_color.dart';
import 'package:space_app/screens/welcome_screen.dart';

void main() {
  runApp(SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        canvasColor: AppColors.black,
      ),
       builder: (context, child) =>
      ColoredBox(color: AppColors.black, child: child),
    
      home: WelcomeScreen(),
    );
  }
}
