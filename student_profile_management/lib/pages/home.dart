import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../connection/database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database db;
  List studentsList = [];

  initialize() {
    db = Database();
    db.initializes();
    db.read().then((value) => {
          setState(() {
            studentsList = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
          itemCount: studentsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 30, left: 36),
                title: Text(studentsList[index]['studentName']),
                trailing: Text(studentsList[index]['rank']),
              ),
            );
          }),
    );
  }
}
