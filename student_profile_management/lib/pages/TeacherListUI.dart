import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/pages/Admin_page.dart';
import 'package:student_profile_management/pages/UserProfileUI.dart';
import 'package:student_profile_management/pages/manageRank.dart';
import 'package:student_profile_management/pages/widgets/header_page.dart';
import 'package:student_profile_management/services/teacherService.dart';
import 'package:toast/toast.dart';

import '../models/student.dart';
import '../services/studentService.dart';

class TeacherListUI extends StatefulWidget {
  static const String testTeacherUIRoute = '/testTeacherUI';
  final TeacherService _teacherService;

  const TeacherListUI({Key? key})
      : _teacherService = const TeacherService(),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TeacherListUIState();
  }
}

class _TeacherListUIState extends State<TeacherListUI> {
  final _formKey = GlobalKey<FormState>();

  bool checkedValue = false;
  bool checkboxValue = false;
  bool state = false;
  String? userType;

  String title = "Teachers";

  final List<Teacher> teachersList = [];
  final box = GetStorage();

  getData() async {
    Future<List<Teacher>> dataset = widget._teacherService.getTeacherList();

    await dataset.then((value) {
      for (var item in value) {
        teachersList.add(item);
      }
    });
    setState(() {
      state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    deleteData({required String id}) async {
      var status = widget._teacherService.deleteTeacher(id: id);

      status.then((value) => value == true
          ? Toast.show("Teacher Deleted", context,
              gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
          : Toast.show("Delete Error", context,
              gravity: Toast.CENTER, duration: Toast.LENGTH_LONG));
    }

    if (!state) {
      getData();
    }

    userType = box.read('userType');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            state == true
                ? ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 210, 10, 0),
                    itemCount: teachersList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) => Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
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
                                      backgroundImage: AssetImage(
                                          '../lib/images/person.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(teachersList[index].name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(children: <Widget>[
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 1.0),
                                  child: FlatButton(
                                    onPressed: () {
                                      deleteData(
                                          id: teachersList[index]
                                              .id
                                              .toString());
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TeacherListUI()),
                                          (Route<dynamic> route) => false);
                                    },
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Text("Delete",
                                        style: TextStyle(color: Colors.white)),
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
