class UserModel {
  final String userId;
  final String email;
  final bool emailVerified;
  final String name;
  final String picture;

  UserModel({
    required this.userId,
    required this.email,
    required this.emailVerified,
    required this.name,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] as String,
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      name: json['name'] as String,
      picture: json['picture'] as String,
    );
  }

}
