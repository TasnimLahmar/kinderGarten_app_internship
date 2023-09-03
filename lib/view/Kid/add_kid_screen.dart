// // ignore_for_file: prefer_const_constructors
//
// import 'package:tinySteps/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import '../../common_widgets/round_gradient_button.dart';
// import '../../common_widgets/round_textfield.dart';
// import '../home/listOfKids_screen.dart';
// import '../welcome/welcome_screen.dart';
// import 'package:intl/intl.dart';
//
//
// class AddKidScreen extends StatefulWidget {
//
//   static String routeName = "/CompleteProfileScreen";
//
//   @override
//   AddKidScreenState createState() => AddKidScreenState();
// }
//
//
// class AddKidScreenState extends State<AddKidScreen> {
//   List<String> enrolledKids = [];
//
//
//   String? selectedGender;
//   TextEditingController dateInput = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//
//   static String routeName = "/AddKidScreen";
//   @override
//   void initState() {
//     dateInput.text = ""; //set the initial value of text field
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(right: 15, left: 15),
//             child: Column(
//               children: [
//                 Image.asset("assets/images/kid_icon.png",
//                     width: media.width * 0.6),
//                 Text(
//                   "Ajouter un enfant",
//                   style: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   "Pour mieux consulter l'état de l'enfant !",
//                   style: TextStyle(
//                     color: AppColors.grayColor,
//                     fontSize: 12,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 25),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   controller: lastNameController, //editing controller of this TextField
//
//
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600]),
//                     hintText: "Nom",
//
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.person_outlined),
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   controller: nameController, //editing controller of this TextField
//
//
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600]),
//                     hintText: "Prénom",
//
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.person_outlined),
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextFormField(
//                   controller: dateInput, //editing controller of this TextField
//
//                   keyboardType: TextInputType.text,
//
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600]),
//                     hintText: "Date de Naissance",
//
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.calendar_today), //icon of text field
//
//                   ),
//                   readOnly: true,  //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context, initialDate: DateTime.now(),
//                         firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101)
//                     );
//
//                     if(pickedDate != null ){
//                       print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
//                       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//                       print(formattedDate); //formatted date output using intl package =>  2021-03-16
//                       //you can implement different kind of Date Format here according to your requirement
//
//                       setState(() {
//                         dateInput.text = formattedDate;
//                       });
//                     }else{
//                       print("Date is not selected");
//                     }
//                   },
//                 ),
//
//                 SizedBox(height: 15),
//
//                 Container(
//                   decoration: BoxDecoration(
//                       color: AppColors.lightGrayColor,
//                       borderRadius: BorderRadius.circular(15)),
//
//                   child: Row(
//                     children: [
//                       Container(
//                           alignment: Alignment.center,
//                           width: 50,
//                           height: 50,
//                           padding: const EdgeInsets.symmetric(horizontal: 15),
//                           child: Image.asset(
//                             "assets/icons/gender_icon.png",
//                             width: 20,
//                             height: 20,
//                             fit: BoxFit.contain,
//                             color: AppColors.blackColor,
//                           )),
//                       Expanded(
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton(
//                             items: ["Fille", "Garçon"]
//                                 .map((name) => DropdownMenuItem(
//                               value: name,
//                               child: Text(
//                                 name,
//                                 style: TextStyle(
//                                   color: AppColors.grayColor,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ))
//                                 .toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedGender = value;
//                               });
//                             },
//                             isExpanded: true,
//                             hint: Text(
//                               selectedGender ?? "Sexe de l'enfant",
//                               style: TextStyle(
//                                 color: AppColors.grayColor,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             value: selectedGender,
//                           ),
//                         ),
//                       ),
//
//
//                       SizedBox(
//                         width: 8,
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 15),
//
//
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   // validator: (value) {
//                   //   if (value!.isEmpty) {
//                   //     return "entrez votre prénom s'il vous plait";
//                   //   }
//                   //   return null;
//                   // },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600]),
//                     hintText: "Poids de l'enfant",
//
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.monitor_weight_outlined),
//
//                   ),
//                 ),
//                 //SizedBox(height: 15),
//                 // RoundTextField(
//                 //   hintText: "Poids de l'enfant",
//                 //   icon: "assets/icons/weight_icon.png",
//                 //   textInputType: TextInputType.text,
//                 // ),
//                 SizedBox(height: 15),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         width: 0,
//                         style: BorderStyle.none,
//                       ),
//                     ),
//                     filled: true,
//                     hintStyle: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600]),
//                     hintText: "Taille de l'enfant",
//
//                     fillColor: Colors.grey[100],
//                     contentPadding: EdgeInsets.all(16),
//                     prefixIcon: Icon(Icons.height),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 RoundGradientButton(
//                   title: "Enregistrer",
//                   onPressed: () {
//                     registerKid();
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void registerKid() {
//     String name = nameController.text;
//     String lastName = lastNameController.text;
//     String dateOfBirth = dateInput.text;
//
//     // Calculate age based on date of birth and current date
//     DateTime now = DateTime.now();
//     DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dateOfBirth);
//     Duration difference = now.difference(birthDate);
//     int ageInDays = difference.inDays;
//     int ageInYears = (ageInDays / 365).floor();
//
//     // Create a label with kid's information
//     String label = "$name $lastName, Added: ${DateFormat('yyyy-MM-dd').format(now)}, Age: $ageInYears";
//     print(label);
//     setState(() {
//       enrolledKids.add(label); // Add the new kid's label to the enrolledKids list
//     });
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ListOfKids(enrolledKids: enrolledKids),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/round_gradient_button.dart';
import '../../model/enrolledKid.dart';
import '../../utils/app_colors.dart';
import 'kid_controller.dart';
import 'package:intl/intl.dart';

class AddKidScreen extends StatelessWidget {
  static String routeName = "/CompleteProfileScreen";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  final KidController kidController = Get.put(KidController());
  String? selectedGender;
  List<String> genderOptions = ["Boy", "Girl"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/kid_icon.png",
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Text(
                  "Ajouter un enfant",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Pour mieux consulter l'état de l'enfant !",
                  style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Nom",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Prénom",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: dateInput,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Date de Naissance",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      dateInput.text = formattedDate;
                    }
                  },
                ),
                SizedBox(height: 15),

                // Dropdown menu for gender selection
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    selectedGender = newValue;
                  },
                  items: genderOptions.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Genre",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),





                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Poids de l'enfant",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    hintText: "Taille de l'enfant",
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(height: 15),
            RoundGradientButton(
                  title: "Enregistrer",
                  onPressed: () {
                    registerKid();
                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }


  void registerKid() {
    String name = nameController.text;
    String lastName = lastNameController.text;
    String dateOfBirth = dateInput.text;
    Gender? selectedEnumGender;

    // Convert selectedGender (String) to Gender (enum)
    if (selectedGender == "Boy") {
      selectedEnumGender = Gender.boy;
    } else if (selectedGender == "Girl") {
      selectedEnumGender = Gender.girl;
    }

    Kid newKid = Kid(name: name, lastName: lastName, dateOfBirth: dateOfBirth,gender: selectedEnumGender ?? Gender.boy, );
    kidController.addKid(newKid);

    Get.back();
  }
  // void registerKid() {
  //   String name = nameController.text;
  //   String lastName = lastNameController.text;
  //   String dateOfBirth = dateInput.text;
  //   Kid newKid = Kid(name: name, lastName: lastName, dateOfBirth: dateOfBirth);
  //   kidController.addKid(newKid);
  //   DateTime now = DateTime.now();
  //   DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dateOfBirth);
  //   Duration difference = now.difference(birthDate);
  //   int ageInDays = difference.inDays;
  //   int ageInYears = (ageInDays / 365).floor();
  //
  //   String label =
  //       "$name $lastName, Added: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}, Age: $ageInYears";
  //   print(label);
  //
  //
  //   Get.back();
  // }
}

