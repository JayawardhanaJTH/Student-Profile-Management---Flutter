import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_profile_management/pages/Admin_page.dart';
import 'package:student_profile_management/pages/UserProfileUI.dart';
import 'package:student_profile_management/pages/manageRank.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';
import 'package:toast/toast.dart';

import '../models/student.dart';
import '../services/studentService.dart';


class StudentListUI extends  StatefulWidget{
  static const String testStudentUIRoute = '/testStudentUI';
  final StudentService _studentService;

  const StudentListUI({Key? key}) :
        _studentService = const StudentService(),super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _StudentListUIState();
  }
}

class _StudentListUIState extends State<StudentListUI> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool state = false;
  String? userType;

  String title = "Students";

  final List<Student> studentsList = [];
  final box = GetStorage();

  getData() async {
    Future<List<Student>> dataset = widget._studentService.getStudentList();

    await dataset.then((value) {
      for (var item in value) {
        studentsList.add(item);
      }
    });
    setState(() {
      state = true;
    });
  }

  deleteData({required String id}) async{
    var status = widget._studentService.deleteStudent(id: id);

    status.then((value) => value == true
      ? Toast.show("Student Deleted", context,
        gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
        : Toast.show("Delete Error", context,
        gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!state) {
      getData();
    }

    userType = box.read("userType");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [

            state == true? ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 210, 10, 0),
              itemCount: studentsList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 55.0,
                                  height: 55.0,
                                  color: Colors.white,
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage('../lib/images/person.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(studentsList[index].name,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 1.0),
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                            builder: (
                                              context) => const TestProfileUIPage()
                                              ),
                                            (Route<dynamic> route) => false
                                        );
                                      },
                                      color: Colors.red[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0),
                                      ),
                                      child: const Text("View",
                                          style: TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 1.0),
                                    child: FlatButton(
                                      onPressed: () {
                                        deleteData(id: studentsList[index].id.toString());
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (
                                                    context) => const StudentListUI()
                                            ),
                                                (Route<dynamic> route) => false
                                        );
                                      },
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0),
                                      ),
                                      child: const Text("Delete",
                                          style: TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(studentsList[index].name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(children: <Widget>[
                                userType == "Teacher"
                                    ? Container(
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 1.0),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Rank(
                                                              student:
                                                                  studentsList[
                                                                      index]),
                                                    ),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          },
                                          color: Colors.red[200],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: const Text("View",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 1.0),
                                        child: FlatButton(
                                          onPressed: () {},
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: const Text("Delete",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(height: 1.0),
            Container(
              height: 150,
              child: const HeaderWidget(150, true, Icons.face),
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const TestAdminPage()),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
