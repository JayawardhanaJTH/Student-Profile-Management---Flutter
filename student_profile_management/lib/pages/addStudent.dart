import 'package:flutter/material.dart';
import 'package:student_profile_management/services/studentService.dart';

import 'admin_home.dart';
import 'package:student_profile_management/models/student.dart';

class AddStudent extends StatefulWidget {
  final StudentService _studentService;

  static const addStudentRoute = "/student";

  const AddStudent({Key? key})
      : _studentService = const StudentService(),
        super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _userName;
  late String _password;
  late String _email;
  late int _rank;

  void onPressedRegister() {
    Student studentObj = Student(null, "student",
        name: _name,
        userName: _userName,
        email: _email,
        password: _password,
        rank: _rank);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminHome.adminHomeRoute);
            },
            icon: const Icon(Icons.admin_panel_settings),
          )
        ],
      ),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  key: _formKey,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "User Name",
                    hintText: "Input User Name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter user name";
                    }
                    return null;
                  },
                  onSaved: (String? userName) {
                    if (userName != null) {
                      _name = userName;
                    }
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
