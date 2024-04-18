// ignore_for_file: file_names

class User {
  final String firstName;
  final String lastName;
  final String userId;
  final String email;
  final String avatarImageUrl;

  const User({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.email,
    required this.avatarImageUrl,
  });

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      firstName: data['first_name'],
      lastName: data['last_name'],
      userId: data['user_id'],
      email: data['email'],
      avatarImageUrl: data['avatar_image_url'],
    );
  }
}
