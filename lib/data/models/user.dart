enum Role { admin, customer, manager }

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

  Map<String, dynamic> toJSON() {
    return {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "middle_name": middleName,
      "phone_number": phoneNumber,
      "role": role.name
    };
  }

  static User fromJSON(data) {
    final String userId = data["user_id"];
    final String firstName = data["first_name"];
    final String middleName = data["middle_name"];
    final String lastName = data["last_name"];
    final String phoneNumber = data["phone_number"];
    Map<String, Role> roles = {
      "admin": Role.admin,
      "customer": Role.customer,
      "manager": Role.manager
    };
    final Role role = roles[data["role"]]!;
    return User(
        role: role,
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        phoneNumber: phoneNumber);
  }
}
