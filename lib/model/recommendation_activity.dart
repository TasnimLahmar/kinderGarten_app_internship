
import 'package:kindergarten_app/model/exercice_description.dart';

import 'segment.dart';
import 'category.dart';

class Recommendation_Activity{
     String activity;
     Segment segment;
     Category category;
     List<Exercice_Description> exercice;
     Recommendation_Activity(this.activity, this.segment,this.category,this.exercice);
}
//..