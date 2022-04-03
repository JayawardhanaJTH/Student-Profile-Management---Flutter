import 'package:student_profile_management/models/user.dart';

class Teacher extends User {
  final String contact;

  const Teacher(String id,
      {required String name,
      required String userName,
      required String email,
      required String password,
      required String userType,
      required this.contact})
      : super(id,
            name: name,
            userName: userName,
            email: email,
            password: password,
            userType: userType);
}
