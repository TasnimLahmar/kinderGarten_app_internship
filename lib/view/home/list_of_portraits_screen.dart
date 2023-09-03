import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/view/home/portrait_screen.dart';
import 'package:intl/intl.dart';


class ListOfPortraits extends StatefulWidget {
  const ListOfPortraits({super.key});

  @override
  State<ListOfPortraits> createState() => _ListOfPortraitsState();
}

class _ListOfPortraitsState extends State<ListOfPortraits> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Liste de portraits"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PortraitScreen());
        },
        child: const Icon(Icons.add),
      ),
      body:
            Center(
            child: Text('No portraits added'),
        ),

    );
  }
}
