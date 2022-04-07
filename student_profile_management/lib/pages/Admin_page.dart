import 'package:flutter/material.dart';
import 'package:student_profile_management/pages/StudentListUI.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';

class TestAdminPage extends  StatefulWidget{
  static const String testAdminHomeRoute = '/testAdmin';

  const TestAdminPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestAdminPageState();
  }
}

class _TestAdminPageState extends State<TestAdminPage>{

  final double _headerHeight = 200;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;


  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.admin_panel_settings),
            ),
            const Text(
              'Admin Panel',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Card(
              color: Color.fromARGB(255, 14, 48, 107),
              elevation: 5,

              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  const Text(
                    "Students",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(StudentListUI.testStudentUIRoute);
                    },
                    icon: const Icon(Icons.face),
                    color: Colors.white,
                    hoverColor: Colors.white30,
                    splashColor: Colors.deepPurple,
                    splashRadius: 500,
                  ),
                ],
              ),
            ),
            Card(
              color: Color.fromARGB(255, 14, 48, 107),
              elevation: 5,
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  const Text(
                    "Teachers",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {},
                    icon: const Icon(Icons.school),
                    color: Colors.white,
                    hoverColor: Colors.white30,
                    splashColor: Colors.deepPurple,
                    splashRadius: 500,
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