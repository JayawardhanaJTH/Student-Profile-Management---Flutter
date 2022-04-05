// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:student_profile_management/connection/database.dart';
import 'package:student_profile_management/models/teacher.dart';
import 'package:student_profile_management/pages/addStudent.dart';
import 'package:student_profile_management/pages/admin_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_profile_management/pages/student_page.dart';
import 'package:student_profile_management/pages/teacher_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAGf9P_bLgwkepg-sihl-ibQ6U3pnI0Ixs", // Your apiKey
      appId: "1:649893214366:android:ed751364a0db558344238f", // Your appId
      messagingSenderId:
          "649893214366-klm93gprgl8s566o3lo3ei4vl3ubhch3.apps.googleusercontent.com", // Your messagingSenderId
      projectId: "studentprofilemanagement-bcd50", // Your projectId
    ),
  );
  Database.createDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color _primaryColor = HexColor('#DC54FE');
  final Color _accentColor = HexColor('#BA02AE');

  MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StudentPage.studentRoute,
      routes: {
        AdminHome.adminHomeRoute: (context) => const AdminHome(),
        AddStudent.addStudentRoute: (context) => const AddStudent(),
        StudentPage.studentRoute: (context) => const StudentPage(),
        TeacherPage.teacherRoute: (context) => const TeacherPage()
      },
    );
  }
}
