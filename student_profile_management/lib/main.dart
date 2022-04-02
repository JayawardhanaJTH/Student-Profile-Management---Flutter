import 'package:flutter/material.dart';
import 'package:student_profile_management/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAGf9P_bLgwkepg-sihl-ibQ6U3pnI0Ixs", // Your apiKey
      appId: "1:649893214366:android:ed751364a0db558344238f", // Your appId
      messagingSenderId: "649893214366-klm93gprgl8s566o3lo3ei4vl3ubhch3.apps.googleusercontent.com", // Your messagingSenderId
      projectId: "studentprofilemanagement-bcd50", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
