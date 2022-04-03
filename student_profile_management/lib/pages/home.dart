import 'package:flutter/material.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/services/studentService.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';


class Home extends StatefulWidget {
  static const homeRoute = "/";
  final StudentService _studentService;

  const Home({Key? key})
      : _studentService = const StudentService(),
        super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List? studentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      // body: ListView.builder(
      //     itemCount: studentsList.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Card(
      //         margin: const EdgeInsets.all(10),
      //         child: ListTile(
      //           contentPadding: const EdgeInsets.only(right: 30, left: 36),
      //           title: Text(studentsList[index]['studentName']),
      //           trailing: Text(studentsList[index]['rank']),
      //         ),
      //       );
      //     }),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              show();
            },
            child: const Text("Get Student"),
          ),
          TextButton(
              onPressed: () {
                add();
              },
              child: const Text("Add Student"))
        ],
      ),
    );
  }

  void show() {
    Toast.show(studentsList.toString(), context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  void add() {
    Student student = Student(
        studentName: "Harsha",
        password: "12dff",
        email: "tiran2323@gmail.com",
        userName: "Tiran",
        userType: "student",
        rank: 4);
    var status = widget._studentService.addStudent(student);

    String value = status.toString();

    Toast.show(value, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}
