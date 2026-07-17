import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/screens/dasboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF9F6),
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
