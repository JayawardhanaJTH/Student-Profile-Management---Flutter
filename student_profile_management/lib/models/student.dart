class Student {
  late String studentName;
  late String email;
  late String password;
  late int rank;
  late String userName;
  late String userType;

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
