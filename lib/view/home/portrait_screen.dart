// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:kindergarten_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindergarten_app/view/Kid/listOfKids_screen.dart';
import 'package:kindergarten_app/view/home/list_of_portraits_screen.dart';
import 'package:select_card/select_card.dart';

class PortraitScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";

  const PortraitScreen({Key? key}) : super(key: key);

  @override
  State<PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  String? selectedCard;
  final List<String> titles = <String>[
    'SocioAffectif',
    'Physique',
    'Cognitif',
    'Langage',
  ];
  String? cardGroupResult2;

  final List<String> cardImages = <String>[
    'assets/icons/baby-girl.png',
    'assets/icons/noise.png',
    'assets/icons/smart_baby.png',
    'assets/icons/langage1.png',
  ];
  List socioList = [
    ' jouer avec d’autres enfants',
    'Copie ou imite les autres',
    'Attend son tour dans les jeux',
    'utilise des mots pour exprimer ses sentiments',
    'Peut se brosser les dents sans aide'
  ];
  List physicList = [
    'marcher',
    'courir',
    'manger tout seul',
    'tourner son dos pendant dormir',
    'faire des betises'
  ];
  List cognitifList = [
    'connait les voix des animaux',
    'connait les types des animaux',
    'ecrire correctement',
    'compter avec ses doigts',
    'obeit quand on lui dit non'
  ];
  List langageList = [
    'dire une phrase correcte',
    'dire un mot correct',
    'crier',
    'pleurer quand il veut manger',
    'dire je t\'aime'
  ];
  String? selected = "choix";
  late List selectedList;
  Set<String> socioSet = Set();
  Set<String> physicSet = Set();
  Set<String> cognitifSet = Set();
  Set<String> langageSet = Set();

  @override
  void initState() {
    super.initState();
    selectedCard = 'SocioAffectif';
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: AppColors.lightGrayColor,
      appBar: AppBar(
        title: Text(
          "Portrait de l'enfant",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text('Infos about the kid'),
            ),
            ListTile(
              title: const Text('Portraits'),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.to(ListOfPortraits());
              },
            ),
            ListTile(
              title: const Text('Gérer les enfants'),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.to(ListOfKids());
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Interventions et soutiens de l'educatrice,",
                          style: TextStyle(
                            color: AppColors.grayColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                SelectGroupCard(
                  context,
                  titles: titles,
                  imageSourceType: ImageSourceType.asset,
                  images: cardImages,
                  cardBackgroundColor: Colors.black12,
                  cardSelectedColor: Colors.orangeAccent,
                  titleTextColor: Colors.blue.shade900,

                  // contentTextColor: Colors.black87, onTap: (title) {
                  // }
                  onTap: (title) {
                    setState(() {
                      selectedCard = title; // Set the selected card
                    });
                  },
                ),

                // Result(text: cardGroupResult2),
                const Divider(
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.secondaryColor2),
                //ttttt
                //socioAffectif

                Visibility(
                  visible: selectedCard == 'SocioAffectif',
                  child: Container(
                    height: media.width * 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.triG),
                        borderRadius:
                        BorderRadius.circular(media.width * 0.065)),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(
                          "assets/icons/bg_dots.png",
                          height: media.width * 0.4,
                          width: double.maxFinite,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/baby-girl.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100, bottom: 370),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SocioAffectif",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 170, bottom: 20),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 3.0,
                              children: socioSet.map((choice) {
                                return ListTile(
                                  title: Text(choice),
                                  trailing: IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        socioSet.remove(choice);
                                        //socioList.add(choice);
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 90, left: 20, right: 20),
                          child: CustomSearchableDropDown(
                            dropdownHintText: 'Chercher ici... ',
                            showLabelInMenu: false,
                            backgroundColor: Colors.transparent,
                            dropdownItemStyle: TextStyle(color: Colors.black),
                            primaryColor: Colors.black45,
                            menuMode: true,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: socioList,
                            label: "choix",
                            prefixIcon: Icon(Icons.add_box),
                            dropDownMenuItems: socioList?.map((item) {
                              return item;
                            })?.toList() ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  selected = "choix";
                                  socioSet.add(value);
                                  //socioList.remove(value);
                                  print(socioSet);
                                } else {
                                  selected = null;
                                }
                              });
                            },
                          ),
                        ),
                        // Display selected choices as labels
                      ],
                    ),
                  ),
                ),
                //
                // SizedBox(height: media.width * 0.05),
                // Container(
                //   height: media.width * 1.2,
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(colors: AppColors.triG),
                //       borderRadius: BorderRadius.circular(media.width * 0.065)),
                //   child: Stack(
                //     alignment: Alignment.topLeft,
                //     children: [
                //       Image.asset(
                //         "assets/icons/bg_dots.png",
                //         height: media.width * 0.4,
                //         width: double.maxFinite,
                //         fit: BoxFit.fitHeight,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           "assets/icons/baby-girl.png",
                //           fit: BoxFit.fitHeight,
                //         ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 100, bottom: 370),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "SocioAffectif",
                //               style: TextStyle(
                //                   color: AppColors.blackColor,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(
                //             top: 170,bottom: 20),
                //         child: SingleChildScrollView(
                //           child: Wrap(
                //             spacing: 8.0,
                //             runSpacing: 3.0,
                //             children: socioSet.map((choice) {
                //               return ListTile(
                //                 title: Text(choice),
                //                 trailing: IconButton(icon:Icon(Icons.cancel),
                //                   onPressed: () {   setState(() {
                //                     socioSet.remove(choice);
                //                     //socioList.add(choice);
                //                   }); },
                //                 ),
                //               );
                //             }).toList(),
                //           ),
                //         ),
                //       ),
                //
                //       // Display selected choices as labels
                //
                //     ],
                //   ),
                // ),
                SizedBox(height: media.width * 0.05),

                //Physique

                Visibility(
                  visible: selectedCard == 'Physique',
                  child: Container(
                    height: media.width * 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.triG),
                        borderRadius:
                        BorderRadius.circular(media.width * 0.065)),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(
                          "assets/icons/bg_dots.png",
                          height: media.width * 0.4,
                          width: double.maxFinite,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/noise.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 120, bottom: 370),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Physique",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 170, left: 30, bottom: 20),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: physicSet.map((choice) {
                                return ListTile(
                                  title: Text(choice),
                                  trailing: IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        physicSet.remove(choice);
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 90, left: 30, right: 30),
                          child: CustomSearchableDropDown(
                            dropdownHintText: 'Chercher ici... ',
                            showLabelInMenu: true,
                            backgroundColor: Colors.transparent,
                            dropdownItemStyle: TextStyle(color: Colors.black),
                            primaryColor: Colors.black45,
                            menuMode: true,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: physicList,
                            prefixIcon: Icon(Icons.add_box),
                            dropDownMenuItems: physicList?.map((item) {
                              return item;
                            })?.toList() ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  //selected = value['class'].toString();
                                  physicSet.add(value);
                                  print(physicSet);
                                }
                              });
                            },
                            label: "choix",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: media.width * 0.05,
                ),

                //Cognitif

                Visibility(
                  visible: selectedCard == 'Cognitif',
                  child: Container(
                    height: media.width * 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.triG),
                        borderRadius:
                        BorderRadius.circular(media.width * 0.065)),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(
                          "assets/icons/bg_dots.png",
                          height: media.width * 0.4,
                          width: double.maxFinite,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            "assets/icons/baby_smart.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 120, bottom: 370),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Cognitif",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 170, left: 30, bottom: 20),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: cognitifSet.map((choice) {
                                return ListTile(
                                  title: Text(choice),
                                  trailing: IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        cognitifSet.remove(choice);
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 90, left: 30, right: 30),
                          child: CustomSearchableDropDown(
                            dropdownHintText: 'Chercher ici... ',
                            showLabelInMenu: true,
                            backgroundColor: Colors.transparent,
                            dropdownItemStyle: TextStyle(color: Colors.black),
                            primaryColor: Colors.black45,
                            menuMode: true,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: cognitifList,
                            label: "choix",
                            prefixIcon: Icon(Icons.add_box),
                            dropDownMenuItems: cognitifList?.map((item) {
                              return item;
                            })?.toList() ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  // selected = value['class'].toString();
                                  cognitifSet.add(value);
                                  print(cognitifSet);
                                } else {
                                  selected = null;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: media.width * 0.05,
                ),

                //Langage

                Visibility(
                  visible: selectedCard == 'Langage',
                  child:
                  choiceBox(image: "assets/icons/langage1.png",
                      category: "Langage",
                      choiceSet: langageSet,
                      choiceList: langageList),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                // choiceBox(image: "assets/icons/langage1.png", category: "Langage", choiceSet: langageSet, choiceList: langageList),

                SizedBox(
                  height: media.width * 0.05,
                ),
                Column(children: [
                  Text(
                    'Commentaires et anecdotes ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintText: "Entrez vos remarques",
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.redAccent))),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget choiceBox({required image, required String category, required Set<
      String> choiceSet, required List<dynamic> choiceList}) {
    var media = MediaQuery
        .of(context)
        .size;

    return Container(
      height: media.width * 1.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.triG),
          borderRadius: BorderRadius.circular(media.width * 0.065)),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            "assets/icons/bg_dots.png",
            height: media.width * 0.4,
            width: double.maxFinite,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 120, bottom: 370),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170, left: 30, bottom: 20),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: choiceSet.map((choice) {
                  return ListTile(
                    title: Text(choice),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          choiceSet.remove(choice);
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90, left: 30, right: 30),
            child: CustomSearchableDropDown(
              dropdownHintText: 'Chercher ici... ',
              showLabelInMenu: true,
              backgroundColor: Colors.transparent,
              dropdownItemStyle: TextStyle(color: Colors.black),
              primaryColor: Colors.black45,
              menuMode: true,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
              items: choiceList,
              label: "choix",
              prefixIcon: Icon(Icons.add_box),
              dropDownMenuItems: choiceList?.map((item) {
                return item;
              })?.toList() ??
                  [],
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    choiceSet.add(value);
                    print(choiceSet);
                  } else {
                    selected = null;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
