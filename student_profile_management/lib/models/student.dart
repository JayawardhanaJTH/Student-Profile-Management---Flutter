import 'package:student_profile_management/models/user.dart';

class Student extends User {
  final int rank;

  Student(String id,
      {required String name,
      required String userName,
      required String email,
      required String password,
      required String userType,
      required this.rank})
      : super(id,
            name: name,
            userName: userName,
            email: email,
            password: password,
            userType: userType);
}
