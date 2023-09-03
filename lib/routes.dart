
import 'package:kindergarten_app/view/activity_tracker/activity_tracker_screen.dart';
import 'package:kindergarten_app/view/dashboard/dashboard_screen.dart';
import 'package:kindergarten_app/view/login/login_screen.dart';
import 'package:kindergarten_app/view/on_boarding/on_boarding_screen.dart';
import 'package:kindergarten_app/view/on_boarding/start_screen.dart';
import 'package:kindergarten_app/view/Kid/add_kid_screen.dart';
import 'package:kindergarten_app/view/signup/signup_screen.dart';
import 'package:kindergarten_app/view/welcome/welcome_screen.dart';
import 'package:kindergarten_app/view/your_goal/your_goal_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) =>  LoginScreen(),
  StartScreen.routeName: (context) => const StartScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  AddKidScreen.routeName: (context) =>  AddKidScreen(),
  YourGoalScreen.routeName: (context) => const YourGoalScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  ActivityTrackerScreen.routeName: (context) => const ActivityTrackerScreen(),
};