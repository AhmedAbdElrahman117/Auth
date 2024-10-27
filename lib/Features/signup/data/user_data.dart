import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String password;
  String? userName;
  Timestamp? dateOfBirth;
  int? userAge;

  UserData(
      {required this.email,
      required this.password,
      this.userName,
      this.dateOfBirth,
      this.userAge});

  set date(Timestamp date) {
    dateOfBirth = date;
  }

  set name(String name) {
    userName = name;
  }

  set age(int age) {
    userAge = age;
  }

  // setPersonalinfo({
  //   required String userName,
  //   required Timestamp dateOfBirth,
  //   required int age,
  // }) {
  //   this.userName = userName;
  //   this.dateOfBirth = dateOfBirth;
  //   this.age = age;
  // }
}
