import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_profile_management/pages/registration_page.dart';
import 'package:student_profile_management/services/loginService.dart';

import 'common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'widgets/header_page.dart';

class LoginPage extends StatefulWidget {
  static const String LoginRoute = "/";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  String? _userName;
  String? _password;

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await Login().loginUser(userName: _userName, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight, true, FontAwesomeIcons.bookReader),
            ),
            SafeArea(
                child: Column(
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                            'Username',
                            'Enter Your Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter user name";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            setState(() {
                              if (value != null) _userName = value;
                            });
                          },
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              'Password', 'Enter Your Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            setState(() {
                              if (value != null) _password = value;
                            });
                          },
                        ),
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Sign In'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            onSubmit();
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text.rich(TextSpan(children: [
                            const TextSpan(text: "Don\'t have an account? "),
                            TextSpan(
                              text: 'Create',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context,
                                      RegistrationPage.registrationRoute);
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            )
                          ])))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
