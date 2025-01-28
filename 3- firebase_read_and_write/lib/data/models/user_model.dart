class UserModel {
  final String name;
  final String age;
  final String favoriteHobby;

  UserModel({
    required this.name,
    required this.age,
    required this.favoriteHobby,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> doc) {
    return UserModel(
      name: doc['name'],
      age: doc['age'],
      favoriteHobby: doc['favoriteHobby'],
    );
  }

  Map<String, dynamic> toFirebase() {
    return {
      'name': name,
      'age': age,
      'favoriteHobby': favoriteHobby,
    };
  }
}
