import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_profile_management/connection/database.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/models/user.dart';
import 'package:student_profile_management/services/studentService.dart';
import 'package:student_profile_management/services/teacherService.dart';

class Login {
  late String _userName;
  late String _password;
  late String _id;
  late CollectionReference _collectionReference;
  Map<String, dynamic>? _data;

  static const String COLLECTION_PATH = "users";

  Login();

  Future<User?> loginUser({required userName, required password}) async {
    _userName = userName;
    _password = password;

    var hashedPassword = md5.convert(utf8.encode(_password));

    _collectionReference = Database.getCollectionRef(path: COLLECTION_PATH);

    await _collectionReference
        .where('userName', isEqualTo: userName)
        .where('password', isEqualTo: hashedPassword.toString())
        .get()
        .then((value) {
      value.docs.forEach((element) {
        _data = element.data() as Map<String, dynamic>;
        _id = element.id;
      });
    });

    if (_data != null) {
      if (_data!['userType'] == "Teacher") {
        return User(_id, "Teacher",
            name: "Teacher",
            userName: "Teacher",
            email: "Teacher",
            password: "Teacher");
      } else if (_data!['userType'] == "Student") {
        return User(_id, "Student",
            name: "Student",
            userName: "Student",
            email: "Student",
            password: "Student");
      } else {
        print("Error");
        return null;
      }
    } else {
      if ((userName == "admin") && (password == "admin")) {
        return const User(null, "Admin",
            name: "Admin",
            userName: "admin",
            email: "Admin",
            password: "admin");
      } else {
        print("Error");
        return null;
      }
    }
  }
}
