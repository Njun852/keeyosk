enum Role { admin, customer }

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final Role role;

  User({
    required this.role,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
  });
}
