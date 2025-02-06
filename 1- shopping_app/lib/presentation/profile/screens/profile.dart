import 'package:first_flutter_project/data/prefs/shared_prefs.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.blue[900],
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Icon(Icons.person_rounded, color: Colors.blue[900], size: 30),
                const SizedBox(width: 12),
                Text(
                  Prefs.getName(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.email_rounded, color: Colors.blue[900], size: 30),
                const SizedBox(width: 12),
                Text(
                  Prefs.getemail(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
