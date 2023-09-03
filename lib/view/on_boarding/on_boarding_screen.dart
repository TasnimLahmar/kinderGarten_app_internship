import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:kindergarten_app/view/on_boarding/widgets/pager_widget.dart';
import 'package:kindergarten_app/view/signup/signup_screen.dart';
import 'package:kindergarten_app/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/OnBoardingScreen";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  List pageList = [
    {
      "title": "Track Your Kid",
      "subtitle":
          "Be aware about the behavior of your kid and track him in every step.",
      "image": "assets/images/bord1.png"
    },
    {
      "title": "Build your kid's personality",
      "subtitle":
          "Make your kids personality stronger and brighter.",
      "image": "assets/images/bord2.png"
    },
    //...
    {
      "title": "Make tiny brilliant minds",
      "subtitle":
          "Teach your kids new things according to their age .",
      "image": "assets/images/bord3.png"
    },
    {
      "title": "Improve kids behavior",
      "subtitle":
          "Improve ",
      "image": "assets/images/bord4.png"
    }
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pageList.length,
            onPageChanged: (i) {
              setState(() {
                selectedIndex = i;
              });
            },
            itemBuilder: (context, index) {
              var temp = pageList[index] as Map? ?? {};
              return PagerWidget(obj: temp);
            },
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor1,
                    value: (selectedIndex+1) / 4,
                    strokeWidth: 3,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: AppColors.primaryColor1),
                  child: IconButton(
                    icon: const Icon(
                      Icons.navigate_next,
                      color: AppColors.whiteColor,
                    ),
                    onPressed: () {
                      if (selectedIndex < 3) {
                        selectedIndex = selectedIndex + 1;
                        pageController.animateToPage(selectedIndex,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInSine);
                      }
                      else{
                        Navigator.pushNamed(context, WelcomeScreen.routeName);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
