import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_read_and_write/data/models/user_model.dart';

class FirebaseUserServices {
  static final db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel user) async {
    try {
      await db.collection('users').doc().set(user.toFirebase());
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      return await db.collection('users').get().then((snapshot) {
        for (var doc in snapshot.docs) {
          users.add(UserModel.fromFirebase(doc.data()));
        }
        return users;
      });
    } catch (e) {
      throw e.toString();
    }
  }
}
