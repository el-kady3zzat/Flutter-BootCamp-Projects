import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/core/utils/route_animation.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/core/utils/ui_helpers.dart';
import 'package:first_flutter_project/core/widgets/button.dart';
import 'package:first_flutter_project/core/widgets/logo.dart';
import 'package:first_flutter_project/core/widgets/text_field.dart';
import 'package:first_flutter_project/data/prefs/shared_prefs.dart';
import 'package:first_flutter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:first_flutter_project/presentation/auth/screens/signin_screen.dart';
import 'package:first_flutter_project/presentation/auth/widgets/or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState> _nameKey = GlobalKey();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey();
  final GlobalKey<FormFieldState> _passKey = GlobalKey();
  final GlobalKey<FormFieldState> _confirmPassKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signupFormKey,
        child: ListView(
          children: [
            const SnaporaLogo(imagePercent: 10),
            //
            SizeConfig.vSpace(6),
            //
            SnaporaTextField(
              controller: _nameController,
              hint: 'enter_your_name'.tr(),
              icon: Icons.person,
              fieldKey: _nameKey,
            ),
            //
            SizeConfig.vSpace(2),
            //
            SnaporaTextField(
              controller: _emailController,
              hint: 'enter_your_email'.tr(),
              icon: Icons.email,
              fieldKey: _emailKey,
            ),
            //
            SizeConfig.vSpace(2),
            //
            SnaporaTextField(
              controller: _passController,
              hint: 'enter_your_password'.tr(),
              icon: Icons.lock,
              fieldKey: _passKey,
            ),
            //
            SizeConfig.vSpace(2),
            //
            SnaporaTextField(
              controller: _confirmPassController,
              hint: 'confirm_your_password'.tr(),
              icon: Icons.lock,
              fieldKey: _confirmPassKey,
            ),
            //
            SizeConfig.vSpace(4),
            //
            _signUpBtn(),
            //
            SizeConfig.vSpace(2),
            //
            const Or(),
            //
            SizeConfig.vSpace(2),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: SnaporaButton(
                text: 'Login',
                onPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    createFadeRoute(const SigninScreen()),
                    (route) => false,
                  );
                },
                width: 20,
                height: 15.5,
              ),
            ),
            //
            SizeConfig.vSpace(6),
          ],
        ),
      ),
    );
  }

  Widget _signUpBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            return mySnackbar(context, state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is RegisterState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RegisterSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Show success msg
              mySnackbar(context, 'Accuont Created Successfully');
              // Navigate to signin screen
              Navigator.of(context).pushAndRemoveUntil(
                createFadeRoute(const SigninScreen()),
                (route) => false,
              );
            });
            // Save user data in prefs
            Prefs.saveUser(
              name: _nameController.text,
              pass: _passController.text,
            );
          }

          return SnaporaButton(
            text: 'sign_up'.tr(),
            onPress: () {
              if (_signupFormKey.currentState!.validate()) {
                _passController.text != _confirmPassController.text
                    ? mySnackbar(context, 'password_do_not_match')
                    : context.read<AuthBloc>().add(
                          RegisterEvent(
                            email: _emailController.text,
                            password: _passController.text,
                          ),
                        );
              }
            },
            width: 20,
            height: 15.5,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
  }
}
