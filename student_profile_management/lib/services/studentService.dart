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
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        studentList.add(
          Student(doc.id,
              name: doc['name'],
              userName: doc['userName'],
              email: doc['email'],
              password: doc['password'],
              userType: doc['userType'],
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

      student = Student(id,
          name: data['name'],
          userName: data['userName'],
          email: data['email'],
          password: data['password'],
          userType: data['userType'],
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
}
