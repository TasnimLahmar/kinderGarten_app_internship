
import 'package:get/get.dart';

import '../../model/enrolledKid.dart';



class KidController extends GetxController {
  final enrolledKids = <Kid>[].obs;

  void addKid(Kid kid) {
    enrolledKids.add(kid);
  }
}