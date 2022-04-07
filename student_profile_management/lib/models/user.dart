class User {
  final String? id;
  final String name;
  final String userName;
  final String password;
  final String email;
  final String userType;

  const User(
    this.id,
    this.userType, {
    required this.name,
    required this.userName,
    required this.email,
    required this.password,
  });

}
