import 'package:flutter/material.dart';
import 'package:kindergarten_app/view/on_boarding/on_boarding_screen.dart';

import 'main.dart';
import 'utils/app_colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigateToApp();

  }
  _navigateToApp() async{
    await Future.delayed(Duration(milliseconds: 2500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
  }
  @override

  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/tiny.jpg",
                width: media.width * 0.8, fit: BoxFit.fitWidth),
            const Text(
              "TinySteps+",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
