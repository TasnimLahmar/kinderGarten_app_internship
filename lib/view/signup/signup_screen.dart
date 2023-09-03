// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:kindergarten_app/view/home/portrait_screen.dart';
import 'package:kindergarten_app/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/round_gradient_button.dart';
import '../../common_widgets/round_textfield.dart';
import '../Kid/add_kid_screen.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "/SignupScreen";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _password = '';
  var _email = '';
  var _phone='';
  var _name='';
  var _lastName='';
  bool isCheck = false;
  bool  _passwordVisible = false;


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  bool isPressed=false;


  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Bienvenue,",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Creer un compte",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  TextFormField(
                    focusNode: _lastNameFocusNode,
                    keyboardType: TextInputType.text,
                    controller: _lastNameController,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "entrez votre nom s'il vous plait";
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
                      hintText: "Nom",
                      errorText: _lastNameError,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(Icons.person_outlined),
                    ),
                    onChanged: (text) => setState(() => _lastName),
                    onFieldSubmitted: (_) {
                      if (!_lastNameFocusNode.hasFocus) {
                        setState(() {});
                      }
                    },
                    validator: (_) => _lastNameError,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    focusNode: _nameFocusNode,
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "entrez votre prénom s'il vous plait";
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
                      hintText: "Prénom",
                      errorText: _nameError,

                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(Icons.person_outlined),
                    ),
                    onChanged: (text) => setState(() => _name),
                    onFieldSubmitted: (_) {
                      if (!_nameFocusNode.hasFocus) {
                        setState(() {});
                      }
                    },
                    validator: (_) => _nameError,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    focusNode: _phoneFocusNode,
                    controller: _phoneController,

                    keyboardType: TextInputType.phone,
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
                      hintText: "Numéro de téléphone",
                      errorText: _phoneError,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(Icons.local_phone_outlined),
                    ),
                    onChanged: (text) => setState(() => _phone),
                    onFieldSubmitted: (_) {
                      if (!_phoneFocusNode.hasFocus) {
                        setState(() {});
                      }
                    },
                    validator: (_) => _phoneError,
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.text,
                    controller: _emailController,
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
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'veuillez entrer votre mot de passe';
                    //   }
                    //   return null;
                    // },
                    keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
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
                  errorText: _passwordError,
                  hintText: 'Entrer votre mot de passe',
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).hintColor,
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
                    validator: (_) => _passwordError ,
              ),

                  SizedBox(
                    height: 40,
                  ),
                  RoundGradientButton(
                    title: "S'inscrire",

                    onPressed: () {
                      isPressed=true;
                      setState(() {

                      });
                      if ((_passwordError == null)&& (_emailError==null)&& (_phoneError==null)&& (_nameError==null)&& (_lastNameError==null)) {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => PortraitScreen(),
                      ),);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Déja membre ?",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),

                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            "Connecter",
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
      ),
    );
  }
  bool isValidEmail(String email) {
    final emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
  String? get _phoneError {
    final phoneText = _phoneController.text;

    if (_phoneFocusNode.hasFocus && phoneText.length ==0 ) {
      return 'ce champ ne doit pas etre vide';
    }
    if (int.tryParse(phoneText)==null &&phoneText.length>0) {
      return 'numero invalide';
    }
    if(phoneText.isEmpty && isPressed==true){
      return "champ obligatoire";
    }
    else{
      return null;
    }

  }

  String? get _passwordError {
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
    if(_emailFocusNode.hasFocus && emailText.isEmpty){
      return 'ce champ ne doit pas etre vide';
    }
    if((emailText.isEmpty && isPressed==true)){
      return "champ obligatoire";
    }
    if(!isValidEmail(emailText) && emailText.length>0){
      return 'adresse email invalide';
    }
    else{
      return null;
    }

  }
  String? get _nameError{
    final nameText = _nameController.text ;
    if((nameText.isEmpty && isPressed==true)){
      return "champ obligatoire";
    }
    if(_nameFocusNode.hasFocus && nameText.length==0){
      return 'ce champ ne doit pas etre vide';
    }
    else{
      return null;
    }
  }
  String? get _lastNameError{
    final lastNameText = _lastNameController.text ;
    if((lastNameText.isEmpty && isPressed==true)){
      return "champ obligatoire";
    }
    if(_lastNameFocusNode.hasFocus && lastNameText.length==0){
      return 'ce champ ne doit pas etre vide';
    }
    else{
      return null;
    }
  }
}
