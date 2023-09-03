

import 'package:kindergarten_app/model/recommendation_activity.dart';

import 'educator.dart';

class Portrait{
  DateTime now = DateTime.now();
  String observations;
  int weight;
  int height;
  List<Recommendation_Activity> recommendation;
  Educator educator;


  Portrait(this.now, this.recommendation,this.educator,this.height,this.weight,this.observations);
}