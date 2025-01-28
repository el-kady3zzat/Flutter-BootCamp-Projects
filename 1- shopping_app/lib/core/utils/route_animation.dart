import 'package:flutter/material.dart';

Route createFadeRoute(Widget screen) {
  return PageRouteBuilder(
    // Defining the widget/page that will be displayed
    pageBuilder: (context, animation1, animation2) => screen,

    // Sets the duration of the transition animation
    transitionDuration: const Duration(seconds: 1),

    // Defining how the transition animation between the pages will look
    transitionsBuilder: (context, animation1, animation2, child) {
      // Defining the range of the animation (from 0.0 to 1.0).
      const begin = 0.0;
      const end = 1.0;

      // Defines the curve for the animation
      const curve = Curves.easeIn;

      // Combines the tween with the curve for a smoother transition
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      // Drives the animation using the tween
      var fadeAnimation = animation1.drive(tween);

      // Applies the fade effect by wrapping the target child in a FadeTransition widget
      return FadeTransition(
        opacity:
            fadeAnimation, // Animates the opacity based on the fadeAnimation
        child: child, // The widget to which the fade effect is applied.
      );
    },
  );
}
