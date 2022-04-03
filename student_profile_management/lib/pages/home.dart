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
  final List<Student> studentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              show();
            },
            child: const Text("Get Students list"),
          ),
          TextButton(
            onPressed: () {
              add(
                  student: Student("",
                      name: "Harsha",
                      password: "12dff",
                      email: "tiran2323@gmail.com",
                      userName: "Tiran",
                      userType: "student",
                      rank: 4));
            },
            child: const Text("Add Student"),
          ),
          TextButton(
            onPressed: () {
              get(id: "id");
            },
            child: const Text("Get Student"),
          ),
          TextButton(
            onPressed: () {
              delete(id: "id");
            },
            child: const Text("Delete Student"),
          ),
        ],
      ),
    );
  }

  void show() async {
    Future<List<Student>> list = widget._studentService.getStudentList();

    await list.then((value) {
      for (var item in value) {
        studentsList.add(item);
      }
    });
  }

  void add({required Student student}) {
    var status = widget._studentService.addStudent(student);

    status.then((value) => value == true
        ? Toast.show("Student Added", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
        : Toast.show("Add Error", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG));
  }

  void get({required String id}) async {
    Student? student;

    var data = widget._studentService.getStudent(id: id);

    await data.then((value) {
      student = value;
    });
  }

  void delete({required String id}) async {
    var status = widget._studentService.deleteStudent(id: id);

    status.then((value) => value == true
        ? Toast.show("Student Deleted", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
        : Toast.show("Delete Error", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG));
  }
}
