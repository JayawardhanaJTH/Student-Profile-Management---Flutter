class Student {
  final String studentName;
  final String email;
  final String password;
  final int rank;
  final String userName;
  final String userType;

  Student(
      {required this.studentName,
      required this.email,
      required this.password,
      required this.userName,
      required this.userType,
      this.rank = 0});

  toJson() {
    return {'studentName': studentName, 'rank': rank};
  }
}
