import 'package:firebase_read_and_write/data/firebase/users_services.dart';
import 'package:firebase_read_and_write/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ShowUsersScreen extends StatefulWidget {
  const ShowUsersScreen({super.key});

  @override
  State<ShowUsersScreen> createState() => _ShowUsersScreenState();
}

class _ShowUsersScreenState extends State<ShowUsersScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  Future _getUsers() async {
    users = await FirebaseUserServices.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => _userItem(users[index]),
      ),
    );
  }

  Widget _userItem(UserModel user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.favoriteHobby),
      trailing: Text(user.age),
    );
  }
}
