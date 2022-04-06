import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/pages/UserProfileUI.dart';
import 'package:student_profile_management/pages/loging_page.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';
import 'package:student_profile_management/services/studentService.dart';
import 'package:student_profile_management/services/teacherService.dart';
import 'package:toast/toast.dart';

import 'common/theme_helper.dart';

class TestEditProfile extends StatefulWidget {
  static const String testEditProfileRoute = "/edit";
  const TestEditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestEditProfileState();
  }
}

class _TestEditProfileState extends State<TestEditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  String? _id;
  String? _userName;
  String? _name;
  String? _email;
  String? _contact;
  String? _userType;
  String? _password;
  int? _rank;

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read('userType') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
    Teacher? _teacher;
    Student? _student;

    if (box.read('userType') == "Student") {
      _student = box.read("user");
      _name = _student!.name;
      _id = _student.id;
      _userName = _student.userName;
      _email = _student.email;
      _rank = _student.rank;
      _userType = "Student";
    } else {
      _teacher = box.read("user");
      _userName = _teacher!.userName;
      _id = _teacher.id;
      _name = _teacher.name;
      _contact = _teacher.contact;
      _email = _teacher.email;
      _userType = "Teacher";
    }

    void onSubmit() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (_userType == "Student") {
          await StudentService().updateStudent(
              student: Student(_id, _userType!,
                  name: _name!,
                  userName: _userName!,
                  email: _email!,
                  password: _password!));

          Toast.show("Student Updated", context,
              gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
        } else {
          await TeacherService().updateTeacher(
              teacher: Teacher(_id, _userType!,
                  name: _name!,
                  userName: _userName!,
                  email: _email!,
                  password: _password!,
                  contact: _contact!));

          Toast.show("Teacher Updated", context,
              gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
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
                    MaterialPageRoute(
                        builder: (context) => TestProfileUIPage()),
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
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            initialValue: _name.toString(),
                            decoration: ThemeHelper().textInputDecoration(
                                'User name', 'Enter your full name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            initialValue: _userName,
                            decoration: ThemeHelper().textInputDecoration(
                                'User name', 'Enter your user name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your user name";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _userName = value;
                              });
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            initialValue: _email,
                            decoration: ThemeHelper().textInputDecoration(
                                "Email", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if ((val == null) ||
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        _userType == "Teacher"
                            ? Container(
                                child: TextFormField(
                                  initialValue: _contact,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Contact", "Enter your mobile number"),
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if ((val == null) ||
                                        (val.isEmpty) ||
                                        !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                      return "Enter a valid phone number";
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      _contact = value;
                                    });
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              )
                            : const SizedBox(height: 1.0),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _password = value;
                              });
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Update".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              onSubmit();
                            },
                          ),
                        ),
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
