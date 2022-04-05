import 'package:flutter/material.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';

import 'common/theme_helper.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.admin_panel_settings),
            ),
            SafeArea(
              child: Column(
                  children: const [
                    Text(
                      'Admin Panel',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ]
              ),
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
                        // const SizedBox(height: 15.0),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) => ProfilePage()
                                //     ),
                                //         (Route<dynamic> route) => false
                                // );
                              }
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