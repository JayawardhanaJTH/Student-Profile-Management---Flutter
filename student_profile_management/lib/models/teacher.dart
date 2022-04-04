import 'package:student_profile_management/models/user.dart';

class Teacher extends User {
  final String contact;

  const Teacher(String id, String userType,
      {required String name,
      required String userName,
      required String email,
      required String password,
      required this.contact})
      : super(
          id,
          userType,
          name: name,
          userName: userName,
          email: email,
          password: password,
        );
}
