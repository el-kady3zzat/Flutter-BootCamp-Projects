import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My First Project',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _body(context),
    );
  }

  // Method to define the body content of the screen.
  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // Centers the content vertically and horizontally.
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imgs(),
          _space(5),
          _txt(),
        ],
      ),
    );
  }

  // Method to display two images side by side.
  Widget _imgs() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, // Spreads the images evenly.
      children: [
        // Displays an image from the local assets folder.
        Image.asset(
          'assets/images/img1.jpg',
          width: SizeConfig.defaultSize! * 15,
          height: SizeConfig.defaultSize! * 15,
        ),
        // Displays an image from a network URL.
        Image.network(
          'https://picsum.photos/150',
          width: SizeConfig.defaultSize! * 15,
          height: SizeConfig.defaultSize! * 15,
        ),
      ],
    );
  }

  // Method to create a vertical space between widgets.
  Widget _space(double space) {
    return SizedBox(height: SizeConfig.defaultSize! * space);
  }

  // Method to display a text widget.
  Widget _txt() {
    return Text(
      'The two images are displayed',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
    );
  }
}
