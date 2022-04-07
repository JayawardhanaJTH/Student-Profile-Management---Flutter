import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:student_profile_management/models/student.dart';
import 'package:student_profile_management/pages/StudentListUI.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';
import 'package:student_profile_management/services/studentService.dart';
import 'package:toast/toast.dart';

import 'common/theme_helper.dart';
import 'forgot_password_verification_page.dart';

class Rank extends StatefulWidget {
  static const String rankRoute = "/rank";
  final Student _student;
  const Rank({Key? key, required Student student})
      : _student = student,
        super(key: key);

  @override
  _RankState createState() => _RankState(_student);
}

class _RankState extends State<Rank> {
  Student? _student;
  int? rank;
  String? id;
  String? name;

  _RankState(Student student) {
    id = student.id;
    name = student.name;
    _student = student;
  }

  final _formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var data = const StudentService().updateStudentRank(id: id!, rank: rank!);

      await data.then((value) {
        if (value == true) {
          Toast.show("Rank Updated", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

          Navigator.of(context).pushNamed(StudentListUI.testStudentUIRoute);
        }
        else{
          Toast.show("Error on Update", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int _rank = _student!.rank;
    id = _student!.id;
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child:
                    HeaderWidget(_headerHeight, true, Icons.password_rounded),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Rank : $name',
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              // textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Select 1-5 according to the student progress',
                              style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              // textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: RatingBar.builder(
                                initialRating: _rank.toDouble(),
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rank = rating.toInt();
                                  });
                                },
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                                "Rank : ${rank == null ? "" : rank.toString()}"),
                            const SizedBox(height: 40.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Save".toUpperCase(),
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
