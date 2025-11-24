// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int id;
  String name;
  String email;
  String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  String toString() {
    return 'User(id: $id , name: $name, email: $email, token: $token)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['user_id'] as int,
    name: json['user_name'] as String,
    email: json['user_email'] as String,
    token: json['access_token'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'token': token,
  };
}
