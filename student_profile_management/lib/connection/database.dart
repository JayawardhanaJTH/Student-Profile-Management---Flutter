import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static late final FirebaseFirestore _firestore;

  static createDatabase() {
    _firestore = FirebaseFirestore.instance;
  }

  static CollectionReference getCollectionRef({required String path}) {
    return _firestore.collection(path);
  }
}
