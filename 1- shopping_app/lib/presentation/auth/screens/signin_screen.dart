import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/core/utils/route_animation.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/core/utils/ui_helpers.dart';
import 'package:first_flutter_project/core/widgets/button.dart';
import 'package:first_flutter_project/core/widgets/logo.dart';
import 'package:first_flutter_project/core/widgets/text_field.dart';
import 'package:first_flutter_project/data/prefs/shared_prefs.dart';
import 'package:first_flutter_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:first_flutter_project/presentation/auth/screens/signup_screen.dart';
import 'package:first_flutter_project/presentation/auth/widgets/or.dart';
import 'package:first_flutter_project/presentation/shopping/screens/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState> _iEmailKey = GlobalKey();
  final GlobalKey<FormFieldState> _iPassKey = GlobalKey();

  final TextEditingController _iEmailController = TextEditingController();
  final TextEditingController _iPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Form(
          key: _signinFormKey,
          child: ListView(
            children: [
              const SnaporaLogo(imagePercent: 10),
              //
              SizeConfig.vSpace(6),
              //
              SnaporaTextField(
                controller: _iEmailController,
                hint: 'enter_your_email'.tr(),
                icon: Icons.email,
                fieldKey: _iEmailKey,
              ),
              //
              SizeConfig.vSpace(2),
              //
              SnaporaTextField(
                controller: _iPassController,
                hint: 'enter_your_password'.tr(),
                icon: Icons.lock,
                fieldKey: _iPassKey,
              ),
              SizeConfig.vSpace(4),
              //
              _signInBtn(),
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
                  text: 'sign_up'.tr(),
                  onPress: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      createFadeRoute(const SignupScreen()),
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
      ),
    );
  }

  Widget _signInBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            return mySnackbar(context, state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is LoginState) {
            return const Center(child: CircularProgressIndicator());
          } //
          else if (state is LoginSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // Navigate to signin screen
              Navigator.of(context).pushAndRemoveUntil(
                createFadeRoute(const ShoppingPage()),
                (route) => false,
              );
            });
            // Save login state in prefs
            Prefs.setLoginState(isLogged: true);
          }

          return SnaporaButton(
            text: 'login'.tr(),
            onPress: () {
              if (_signinFormKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      LoginEvent(
                        email: _iEmailController.text,
                        password: _iPassController.text,
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
    _iEmailController.dispose();
    _iPassController.dispose();
  }
}
