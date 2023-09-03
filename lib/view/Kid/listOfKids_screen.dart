// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:tinySteps/view/profile/add_kid_screen.dart';
//
// import '../../utils/app_colors.dart';
//
// class ListOfKids extends StatefulWidget {
//   final List<String> enrolledKids;
//
//     ListOfKids({super.key, required this.enrolledKids});
//   @override
//   State<ListOfKids> createState() => _ListOfKidsState();
// }
// class _ListOfKidsState extends State<ListOfKids> {
//
//   @override
//   Widget build(BuildContext context) {
//    // var media = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List of enrolled kids'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//           });
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddKidScreen(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: widget.enrolledKids.isEmpty
//           ? Center(
//         child: Text('No kids enrolled'),
//       )
//           : ListView(
//         children: [
//           SizedBox(height: 20),
//           ...widget.enrolledKids
//               .map((kid) => Text(
//             kid,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ))
//               .toList(),
//         ],
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/view/Kid/add_kid_screen.dart';
import 'package:intl/intl.dart';
import 'kid_controller.dart';


class ListOfKids extends StatelessWidget {
  final KidController kidController = Get.put(KidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of enrolled kids'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddKidScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
            () => kidController.enrolledKids.isEmpty
            ? Center(
          child: Text('No kids enrolled'),
        )
                : ListView(
              children: kidController.enrolledKids
                  .map(
                    (kid) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(

                    '${kid.name} ${kid.lastName}\nDate of Birth: ${kid.dateOfBirth}\nAdded: ${DateFormat('yyyy-MM-dd').format(DateTime.now())} \n Gender: ${kid.gender.name}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Image.asset(name);
              )
                  .toList(),
            ),
      ),
    );
  }
}
