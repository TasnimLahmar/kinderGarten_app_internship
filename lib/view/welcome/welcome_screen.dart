import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:kindergarten_app/view/dashboard/dashboard_screen.dart';
import 'package:kindergarten_app/view/login/login_screen.dart';
import 'package:kindergarten_app/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/round_gradient_button.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/WelcomeScreen";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
              SizedBox(height: media.width * 0.01),
              const Text(
                "Pour mieux consulter l'etat de votre enfant \n pour avoir un enfant sain et actif",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                  height: media.width * 0.1
              ),
              RoundGradientButton(

                title: "Se connecter",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
              SizedBox(
                  height: media.width * 0.01
              ),
              RoundGradientButton(
                title: "S'inscrire",
                onPressed: () {
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
