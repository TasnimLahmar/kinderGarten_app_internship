// ignore_for_file: prefer_const_constructors

import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:kindergarten_app/view/dashboard/dashboard_screen.dart';
import 'package:kindergarten_app/view/home/portrait_screen.dart';
import 'package:kindergarten_app/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/round_gradient_button.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  var _password = '';
  var _email = '';
  bool  _passwordVisible = false;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPressed=false;
  String? get _errorText {
    final passwordText = _passwordController.text;

    if (_passwordFocusNode.hasFocus && passwordText.length ==0 ) {
      return 'ce champ ne doit pas etre vide';
    }
    if (passwordText.length < 4 && passwordText.length>0) {
      return 'très court';
    }
    if(passwordText.isEmpty && isPressed==true){
      return "champ obligatoire";
    }
    else{
    return null;
    }

  }


  String? get _emailError{
    final emailText = _emailController.text;
    if((emailText.isEmpty && isPressed==true)){
      return "champ obligatoire";
    }
    if(_emailFocusNode.hasFocus && emailText.length==0){
      return 'ce champ ne doit pas etre vide';
    }
    if(!isValidEmail(emailText) && emailText.length>0){
      return 'adresse email invalide';
    }

    else{
      return null;
    }

  }

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: media.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.width*0.06,
                      ),
                      const Text(
                        "Bienvenue,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: media.width*0.02),
                      const Text(
                        "TinySteps+",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width*0.2),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.text,


                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'veuillez entrer votre adresse email';
                  //   }
                  //   if (!isValidEmail(value)) {
                  //     return 'adresse email invalide';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),

                    ),
                    filled: true,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]),
                    hintText: "Adresse Email",
                    labelText: 'Email',
                    errorText: _emailError,
                    labelStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]),

                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  onChanged: (text) => setState(() => _email),
                  onFieldSubmitted: (_) {
                    if (!_emailFocusNode.hasFocus) {
                      setState(() {});
                    }
                  },
                  validator: (_) => _emailError,
                ),
                SizedBox(height: media.width*0.05),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]),
                    labelText: 'Mot de passe',
                    errorText: _errorText,

                    hintText: 'Entrer votre mot de passe',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]),

                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                  onChanged: (text) => setState(() => _password),
                  onFieldSubmitted: (_) {
                    if (!_passwordFocusNode.hasFocus) {
                      setState(() {});
                    }
                  },
                  validator: (_) => _errorText ,

                ),
                SizedBox(height: media.width*0.03),
                const Text("Forgot your password?",
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 10,
                    )),
                SizedBox(height: media.width*0.1),

                RoundGradientButton(
                  title: "Connecter",

                  onPressed: () {
                    isPressed=true;
                    setState(() {

                    });
                  if ((_errorText == null)&& (_emailError==null)) {

                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PortraitScreen(),
                      ),);}
                  },
                ),
                SizedBox(height: media.width*0.01),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayColor.withOpacity(0.5),
                        )),
                    Text("  Or  ",
                        style: TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayColor.withOpacity(0.5),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.primaryColor1.withOpacity(0.5), width: 1, ),
                        ),
                        child: Image.asset("assets/icons/google_icon.png",width: 20,height: 20,),
                      ),
                    ),
                    SizedBox(width: 30,),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.primaryColor1.withOpacity(0.5), width: 1, ),
                        ),
                        child: Image.asset("assets/icons/facebook_icon.png",width: 20,height: 20,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account yet ?",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),

                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: AppColors.secondaryColor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w800),

                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    final emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kindergarten_app/utils/app_colors.dart';
// import 'package:kindergarten_app/view/signup/signup_screen.dart';
// import '../../common_widgets/round_gradient_button.dart';
// import 'login_controller.dart';
//
//
//
// class LoginScreen extends StatelessWidget {
//   static String routeName = "/LoginScreen";
//   final LoginController _loginController = Get.put(LoginController());
//   var _email='';
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: media.width,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: media.width * 0.06,
//                     ),
//                     const Text(
//                       "Bienvenue,",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     SizedBox(height: media.width * 0.02),
//                     const Text(
//                       "TinySteps+",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: 20,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: media.width * 0.2),
//               TextFormField(
//                 controller: _loginController.emailController,
//                 focusNode:_loginController.emailFocusNode,
//
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(
//                       width: 0,
//                       style: BorderStyle.none,
//                     ),
//                   ),
//                   filled: true,
//                   hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                   hintText: "Adresse Email",
//                   labelText: 'Email',
//                   errorText: _loginController.emailError,
//                   labelStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                   fillColor: Colors.grey[100],
//                   contentPadding: EdgeInsets.all(16),
//                   prefixIcon: Icon(Icons.email_outlined),
//                 ),
//                 onChanged: (text) {
//                   _loginController.emailController.value = _loginController.emailController.value.copyWith(
//                     text: text,
//                     selection: TextSelection.collapsed(offset: text.length),
//                   );
//                 },
//                 onFieldSubmitted: (_) => _loginController.emailFocusNode.unfocus(),
//                 validator: (_) => _loginController.emailError,
//               ),
//               SizedBox(height: media.width * 0.05),
//               Obx(
//                     () => TextFormField(
//                   controller: _loginController.passwordController,
//                   keyboardType: TextInputType.text,
//                   obscureText: !_loginController.passwordVisible.value,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                     labelText: 'Mot de passe',
//                     errorText: _loginController.errorText,
//                     hintText: 'Entrer votre mot de passe',
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _loginController.passwordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Theme.of(context).primaryColorDark,
//                       ),
//                       onPressed: () {
//                         _loginController.togglePasswordVisibility();
//                       },
//                     ),
//                     labelStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.lock_outline_rounded),
//                   ),
//
//
//
//
//                 ),
//               ),
//               SizedBox(height: media.width * 0.03),
//               const Text(
//                 "Forgot your password?",
//                 style: TextStyle(color: AppColors.grayColor, fontSize: 10),
//               ),
//               SizedBox(height: media.width * 0.1),
//               RoundGradientButton(
//                 title: "Connecter",
//                 onPressed: () {
//                   _loginController.login();
//                 },
//               ),
//               SizedBox(height: media.width * 0.01),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       width: double.maxFinite,
//                       height: 1,
//                       color: AppColors.grayColor.withOpacity(0.5),
//                     ),
//                   ),
//                   Text(
//                     "  Or  ",
//                     style: TextStyle(
//                       color: AppColors.grayColor,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: double.maxFinite,
//                       height: 1,
//                       color: AppColors.grayColor.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(14),
//                         border: Border.all(
//                           color: AppColors.primaryColor1.withOpacity(0.5),
//                           width: 1,
//                         ),
//                       ),
//                       child: Image.asset(
//                         "assets/icons/google_icon.png",
//                         width: 20,
//                         height: 20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 30),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(14),
//                         border: Border.all(
//                           color: AppColors.primaryColor1.withOpacity(0.5),
//                           width: 1,
//                         ),
//                       ),
//                       child: Image.asset(
//                         "assets/icons/facebook_icon.png",
//                         width: 20,
//                         height: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don’t have an account yet ?",
//                     style: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Get.toNamed(SignupScreen.routeName);
//                     },
//                     child: Text(
//                       "S'inscrire",
//                       style: TextStyle(
//                         color: AppColors.secondaryColor1,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
