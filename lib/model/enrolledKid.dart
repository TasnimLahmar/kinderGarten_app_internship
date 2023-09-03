
class Kid {
   final String name;
   final String lastName;
   final String dateOfBirth;
   final Gender gender;
   //List<Portrait> list_de_portraits;


   Kid({required this.name, required this.lastName, required this.dateOfBirth, required this.gender ,/*this.list_de_portraits*/});
}

enum Gender{
   boy,girl
}