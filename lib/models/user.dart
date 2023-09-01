final String tableUsers = 'users';


class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, username, password
  ];

  static final String id = 'id';
  static final String username = 'username';
  static final String password = 'password';
  static final String title = 'title';
}

class User {
  final int? id;
  final String username;
  final String password;

  const User({
    required this.id,
    required this.username,
    required this.password,
  });

  User copy({
    int? id,
    String? username,
    String? password
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.username,
      );

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
        
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.password: password,
      };
}