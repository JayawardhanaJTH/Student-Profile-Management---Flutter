import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:student_profile_management/connection/database.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/models/teacher.dart';

class TeacherService {
  //user(student and teacher) data storage collection path name
  static const String COLLECTION_PATH = "users";

  const TeacherService();
/*===============================================
                 Business functions
  ===============================================
*/
//add teacher details to firebase storage
  Future<bool?> addTeacher(Teacher teacher) async {
    bool? status;
    //encrypt user password to md5
    var password = md5.convert(utf8.encode(teacher.password));

    Map<String, dynamic> data = {
      "name": teacher.name,
      "contact": teacher.contact,
      "password": password.toString(),
      "userName": teacher.userName,
      "userType": teacher.userType,
      "email": teacher.email
    };

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc()
        .set(data)
        .whenComplete(() => status = true)
        .onError((error, stackTrace) => status = false);

    return status;
  }

//get all teacher details and sort according to the rank
  Future<List<Teacher>> getTeacherList() async {
    List<Teacher> teacherList = [];

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        teacherList.add(
          Teacher(doc.id, doc['userType'],
              name: doc['name'],
              userName: doc['userName'],
              email: doc['email'],
              password: doc['password'],
              contact: doc['contact']),
        );
      });
    });

    return teacherList;
  }

// get teacher details with document reference id
  Future<Teacher?> getTeacher({required String id}) async {
    Teacher? teacher;

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc(id)
        .get()
        .then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;

      teacher = Teacher(
        id,
        data['userType'],
        name: data['name'],
        userName: data['userName'],
        email: data['email'],
        password: data['password'],
        contact: data['contact'],
      );
    });

    return teacher;
  }

//delete function - use document reference id
  Future<bool?> deleteTeacher({required String id}) async {
    bool? status;

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc(id)
        .delete()
        .then((value) {
      status = true;
    }).onError((error, stackTrace) {
      status = false;
    });

    return status;
  }

  Future<bool?> updateTeacher(
      {required String id, required Teacher teacher}) async {
    bool state = false;

    var password = md5.convert(utf8.encode(teacher.password));

    Map<String, dynamic> data = {
      "name": teacher.name,
      "contact": teacher.contact,
      "password": password.toString(),
      "userName": teacher.userName,
      "userType": teacher.userType,
      "email": teacher.email
    };

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc(id)
        .update(data)
        .then((value) => state = true)
        .onError((error, stackTrace) => state = false);
  }
}
