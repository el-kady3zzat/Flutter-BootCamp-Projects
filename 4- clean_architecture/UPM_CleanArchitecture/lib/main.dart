import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_management/core/injector.dart';
import 'package:user_profile_management/presentation/bloc/user_cubit.dart';
import 'package:user_profile_management/presentation/pages/home.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..fetchUsers(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Profile Management',
        home: Home(),
      ),
    );
  }
}
