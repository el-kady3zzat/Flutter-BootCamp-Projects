class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toFirebase() {
    return {
      id: id,
      name: name,
      email: email,
      password: password,
    };
  }
}
