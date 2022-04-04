import 'package:flutter/material.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/services/teacherService.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';

class TeacherPage extends StatefulWidget {
  static const teacherRoute = "/teacher";
  final TeacherService _teacherService;

  const TeacherPage({Key? key})
      : _teacherService = const TeacherService(),
        super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  final List<Teacher> teachersList = [];

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
            child: const Text("Get Teachers list"),
          ),
          TextButton(
            onPressed: () {
              add(
                  teacher: const Teacher("", "Teacher",
                      name: "Harsha",
                      password: "12dff",
                      email: "tiran2323@gmail.com",
                      userName: "Tiran",
                      contact: "1231"));
            },
            child: const Text("Add teacher"),
          ),
          TextButton(
            onPressed: () {
              get(id: "HHkMLhedjr3hnDWhCJ1J");
            },
            child: const Text("Get teacher"),
          ),
          TextButton(
            onPressed: () {
              delete(id: "SwVBncTCGXKLUSGjDH3Y");
            },
            child: const Text("Delete teacher"),
          ),
        ],
      ),
    );
  }

  void show() async {
    Future<List<Teacher>> list = widget._teacherService.getTeacherList();
    await list.then((value) {
      for (var item in value) {
        teachersList.add(item);
      }
    });
    print(teachersList.length);
  }

  void add({required Teacher teacher}) {
    var status = widget._teacherService.addTeacher(teacher);

    status.then((value) => value == true
        ? Toast.show("Teacher Added", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
        : Toast.show("Add Error", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG));
  }

  void get({required String id}) async {
    Teacher? teacher;

    var data = widget._teacherService.getTeacher(id: id);

    await data.then((value) {
      teacher = value;
    });
  }

  void delete({required String id}) async {
    var status = widget._teacherService.deleteTeacher(id: id);

    status.then((value) => value == true
        ? Toast.show("Teacher Deleted", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG)
        : Toast.show("Delete Error", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG));
  }
}
