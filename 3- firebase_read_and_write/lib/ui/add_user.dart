import 'package:firebase_read_and_write/data/firebase/users_services.dart';
import 'package:firebase_read_and_write/data/models/user_model.dart';
import 'package:firebase_read_and_write/ui/show_users.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController hobbyController = TextEditingController();

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: _decoration('Enter your name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: _decoration('Enter your age'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: hobbyController,
              decoration: _decoration('Enter your favorite hobby'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _addUser(),
              child: SizedBox(
                width: 150,
                height: 50,
                child: Center(
                  child: Text('Add User'),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShowUsersScreen()),
                );
              },
              child: SizedBox(
                width: 150,
                height: 50,
                child: Center(
                  child: Text('Show Users'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(hintText: hint, border: OutlineInputBorder());
  }

  void _addUser() async {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        hobbyController.text.isEmpty) {
      _showSnackbar('Please Fill All Data First');
    } else {
      UserModel user = UserModel(
        name: nameController.text,
        age: ageController.text,
        favoriteHobby: hobbyController.text,
      );
      await FirebaseUserServices.addUser(user).then((_) {
        _clearControllers();
        _showSnackbar('User Added Successfully');
      }).onError((e, s) {
        _showSnackbar(e.toString());
      });
    }
  }

  void _showSnackbar(String txt) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(txt)));
  }

  void _clearControllers() {
    nameController.clear();
    ageController.clear();
    hobbyController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    hobbyController.dispose();
  }
}
