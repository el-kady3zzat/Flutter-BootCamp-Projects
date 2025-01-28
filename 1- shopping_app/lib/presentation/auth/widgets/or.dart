import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.blue[900])),
          Text(
            '   OR   ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          Expanded(child: Container(height: 1, color: Colors.blue[900])),
        ],
      ),
    );
  }
}
