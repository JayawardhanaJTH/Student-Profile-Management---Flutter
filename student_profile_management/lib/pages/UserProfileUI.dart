import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/models/user.dart';
import 'package:student_profile_management/pages/EditProfile.dart';
import 'package:student_profile_management/pages/StudentListUI.dart';
import 'package:student_profile_management/pages/loging_page.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';

import 'common/theme_helper.dart';

class TestProfileUIPage extends StatefulWidget {
  static const String profileUIRoute = "/profile";

  const TestProfileUIPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestProfileUIPageState();
  }
}

class _TestProfileUIPageState extends State<TestProfileUIPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  var name = "test";

  String? _userName;
  String? _email;
  String? _contact;
  String? _userType;
  int? _rank;

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Teacher? _teacher;
    Student? _student;

    if (box.read('userType') == "Student") {
      _student = box.read("user");
      _userName = _student!.userName;
      _email = _student.email;
      _rank = _student.rank;
      _userType = "Student";
    } else {
      _teacher = box.read("user");
      _userName = _teacher!.userName;
      _contact = _teacher.contact;
      _email = _teacher.email;
      _userType = "Teacher";
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: const HeaderWidget(
                  150, false, Icons.person_add_alt_1_rounded),
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _userName.toString(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(height: 20.0),
                        Container(),
                        Text(
                          'E-mail Address : $_email',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          _userType == "Student"
                              ? 'Rank : $_rank'
                              : 'Mobile Number : $_contact',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Edit".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  TestEditProfile.testEditProfileRoute);
                            },
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        _userType == "Teacher"
                            ? Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Students".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        TestStudentListUI.testStudentUIRoute);
                                  },
                                ),
                              )
                            : const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
