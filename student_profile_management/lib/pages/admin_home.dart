import 'package:flutter/material.dart';
import 'package:student_profile_management/pages/addStudent.dart';

class AdminHome extends StatelessWidget {
  static const String adminHomeRoute = '/admin';
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
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
                    "Add Student",
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
                          .pushNamed(AddStudent.addStudentRoute);
                    },
                    icon: const Icon(Icons.add_task_outlined),
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
                    "Add Teacher",
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
                    icon: const Icon(Icons.add_task_outlined),
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
                    "Delete Student",
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
                    icon: const Icon(Icons.delete),
                    color: Colors.redAccent,
                    hoverColor: Colors.white30,
                    splashColor: Colors.red,
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
                    "Delete Teacher",
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
                    icon: const Icon(Icons.delete),
                    color: Colors.redAccent,
                    hoverColor: Colors.white30,
                    splashColor: Colors.red,
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
