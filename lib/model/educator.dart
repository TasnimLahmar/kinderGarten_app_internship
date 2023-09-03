import 'enrolledKid.dart';

class Educator{
  String _id;
  String firstName;
  String lastName;
  String email;
  int phone;
  String password;
  int maxKids;
  List<Kid> list_kids;

  Educator(this._id, this.firstName, this.lastName, this.email, this.phone,
      this.password,this.maxKids,this.list_kids);

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}