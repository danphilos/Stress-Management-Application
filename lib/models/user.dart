const String tableUsers = 'users';


class UserFields {
  static final List<String> values = [
    id, username, password, email
  ];

  static const String id = 'id';
  static const String username = 'username';
  static const String password = 'password';
  static const String email = 'email';
}

class User {
  final int? id;
  final String username;
  final String password;
  final String? email;

  const User({
    this.id,
    required this.username,
    required this.password,
    this.email
  });

  User copy({
    int? id,
    String? username,
    String? password,
    String? email
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.username,
        email: email ?? this.email
      );

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
        email: json[UserFields.email] as String
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.password: password,
        UserFields.email: email
      };
}