import 'educator.dart';
import 'enrolledKid.dart';

class KinderGarten{
  String id;
  String name;
  List<Educator> teachers;
 // List<Kid> enrolled_kids;
  int maxKids;

  KinderGarten(this.name, this.teachers, this.id,this.maxKids);
}