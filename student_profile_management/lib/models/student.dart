// import 'package:cloud_firestore/cloud_firestore.dart';

// class Student {
//   late String studentName;
//   late int rank;

//   late DocumentReference documentReference;

//   Student({required this.studentName, this.rank = 0});

//   Student.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
//     studentName = map['studentName'];
//     rank = map['rank'];
//   }

//   Student.fromSnapshot(DocumentSnapshot snapshot) {
//     this.fromMap(snapshot.data, documentReference: snapshot.reference);
//   }

//   toJson() {
//     return {'studentName': studentName, 'rank': rank};
//   }
// }
