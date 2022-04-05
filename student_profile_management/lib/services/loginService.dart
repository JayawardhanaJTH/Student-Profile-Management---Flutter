import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:student_profile_management/connection/database.dart';

class Login {
  late String _userName;
  late String _password;
  late CollectionReference _collectionReference;
  Map<String, dynamic>? _data;

  static const String COLLECTION_PATH = "users";

  Login();

  loginUser({required userName, required password}) async {
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
      });
    });

    if (_data != null) {
      if (_data!['userType'] == "Teacher") {
        print("T");
      } else if (_data!['userType'] == "Student") {
        print("S");
      } else {
        print("Error");
      }
    } else {
      if ((userName == "admin") && (password == "admin")) {
        print("A");
      } else {
        print("Error");
      }
    }
  }
}
