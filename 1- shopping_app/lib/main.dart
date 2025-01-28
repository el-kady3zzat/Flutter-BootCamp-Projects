import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/data/prefs/shared_prefs.dart';
import 'package:first_flutter_project/firebase_options.dart';
import 'package:first_flutter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:first_flutter_project/presentation/auth/screens/signin_screen.dart';
import 'package:first_flutter_project/presentation/auth/screens/signup_screen.dart';
import 'package:first_flutter_project/presentation/home/screens/home_page.dart';
import 'package:first_flutter_project/presentation/shopping/screens/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Prefs.init();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SizeConfig class to adapt the app to various screen sizes.
    SizeConfig().init(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // Removes the "debug" banner from the top-right corner of the app.
      debugShowCheckedModeBanner: false,

      // The title of the app.
      title: 'Flutter BootCamp',

      theme: ThemeData(
        // Sets the color of the AppBar in the app's theme.
        appBarTheme: AppBarTheme(
          color: Colors.blue[900],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue[900],
            statusBarIconBrightness: Brightness.light,
          ),
        ),

        // Specifies the default font family for the app.
        fontFamily: 'Suwannaphum',
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 20, // Sets the font size.
            fontWeight: FontWeight.bold, // Makes the text bold.
            color: Colors.blue[900], // Sets the text color to dark blue.
          ),
        ),
      ),

      // Sets the initial screen of the app.
      home: Prefs.isLogged()
          ? const ShoppingPage()
          : BlocProvider(
              create: (context) => AuthBloc(),
              child: SigninScreen(),
            ),
      routes: {
        '/signin': (context) => BlocProvider(
              create: (context) => AuthBloc(),
              child: SigninScreen(),
            ),
        '/signup': (context) => BlocProvider(
              create: (context) => AuthBloc(),
              child: SignupScreen(),
            ),
        '/home': (context) => const HomePage(),
        '/shopping': (context) => const ShoppingPage(),
      },
    );
  }
}
