import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:student_profile_management/connection/database.dart';
import 'package:student_profile_management/models/student.dart';

class StudentService {
  //user(student and teacher) data storage collection path name
  static const String COLLECTION_PATH = "users";

  const StudentService();
/*===============================================
                 Business functions
  ===============================================
*/
//add student details to firebase storage
  Future<bool?> addStudent(Student student) async {
    bool? status;
    //encrypt user password to md5
    var password = md5.convert(utf8.encode(student.password));

    Map<String, dynamic> data = {
      "name": student.name,
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

//get all students details and sort according to the rank
  Future<List<Student>> getStudentList() async {
    List<Student> studentList = [];

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .orderBy('rank', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        studentList.add(
          Student(doc.id, doc['userType'],
              name: doc['name'],
              userName: doc['userName'],
              email: doc['email'],
              password: doc['password'],
              rank: doc['rank']),
        );
      });
    });

    return studentList;
  }

// get student details with document reference id
  Future<Student?> getStudent({required String id}) async {
    Student? student;

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc(id)
        .get()
        .then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;

      student = Student(id, data['userType'],
          name: data['name'],
          userName: data['userName'],
          email: data['email'],
          password: data['password'],
          rank: data['rank']);
    });

    return student;
  }

//delete function - use document reference id
  Future<bool?> deleteStudent({required String id}) async {
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

  Future<bool?> updateStudent(
      {required String id, required Student student}) async {
    bool state = false;

    var password = md5.convert(utf8.encode(student.password));

    Map<String, dynamic> data = {
      "name": student.name,
      "rank": student.rank,
      "password": password.toString(),
      "userName": student.userName,
      "userType": student.userType,
      "email": student.email
    };

    await Database.getCollectionRef(path: COLLECTION_PATH)
        .doc(id)
        .update(data)
        .then((value) => state = true)
        .onError((error, stackTrace) => state = false);
  }
}
