import 'package:get/get.dart';
import 'package:kindergarten_app/routes.dart';
import 'package:kindergarten_app/splash_screen.dart';
import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TinySteps',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor1,
          useMaterial3: true,
          fontFamily: "Poppins"
      ),
      home: const SplashScreen(),
    );
  }
}

