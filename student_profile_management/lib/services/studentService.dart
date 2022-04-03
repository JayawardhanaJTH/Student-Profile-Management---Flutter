import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:student_profile_management/connection/database.dart';
import 'package:student_profile_management/models/student.dart';

class StudentService {
  static const String COLLECTION_PATH = "users";

  const StudentService();

  Future<bool?> addStudent(Student student) async {
    bool status = false;
    var password = md5.convert(utf8.encode(student.password));

    Map<String, dynamic> data = {
      "studentName": student.studentName,
      "rank": student.rank,
      "password": password.toString(),
      "userName": student.userName,
      "userType": student.userType,
      "email": student.email
    };

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc()
        .set(data)
        .whenComplete(() => status = true)
        .onError((error, stackTrace) => status = false);

    return status;
  }
}
