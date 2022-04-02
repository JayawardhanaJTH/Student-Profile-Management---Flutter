import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  final String COLLECTION_PATH = "students";

  late FirebaseFirestore firestore;

  initializes() {
    firestore = FirebaseFirestore.instance;
  }

  Future read() async {
    QuerySnapshot querySnapshot;
    List studentsList = [];

    try {
      querySnapshot = await firestore.collection(COLLECTION_PATH).get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map map = {
            "id": doc.id,
            "studentName": doc['studentName'],
            "rank": doc['rank']
          };
          studentsList.add(map);
        }
        return studentsList;
      }
    } catch (e) {
      print(e);
    }
  }
}
