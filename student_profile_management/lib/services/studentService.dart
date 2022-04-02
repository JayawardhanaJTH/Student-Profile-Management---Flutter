// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:student_profile_management/models/student.dart';

// class StudentService {
//   final String fireStoreCollectionName = 'students';

//   addStudent(Student student) async {
//     try {
      
//       FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
//         await FirebaseFirestore.instance
//             .collection(fireStoreCollectionName)
//             .document
//             .(student.toJson());
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   updateStudent(Student student) {
//     try {
//       Firestore.instance.runTransaction((transaction) async {
//         await transaction.update(student.documentReference, student.toJson());
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   deleteStudent(Student student) {
//     Firestore.instance.runTransaction(
//       (Transaction transaction) async{
//         await transaction.delete(student.documentReference);
//       }
//     )
//   }

//   Student getStudent(int id) {
//     return new Student(studentName: 'studentName', grade: 2);
//   }

//   List<Student> getStudentList() {
//     return Firestore.instance.collection(fireStoreCollectionName).snapshots();
//   }
// }
