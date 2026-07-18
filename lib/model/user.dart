
class User {
  final String? email;
  final String? password;
  final String? name;
  final String? role;
  final DateTime? createdAt;
  
  User({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.createdAt,
  });
  
  @override
  String toString() {
    return "User(name: $name, email: $email, role: $role)";
  }
}