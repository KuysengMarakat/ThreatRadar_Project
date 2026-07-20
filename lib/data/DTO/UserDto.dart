

import 'package:my_app/model/user.dart';

class UserDto {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      "email": user.email,
      "password": user.password,
      "name": user.name,
      "role": user.role,
      "createdAt": user.createdAt.toString(),
    };
  }
}
