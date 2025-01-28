import 'dart:async';

import 'package:first_flutter_project/data/firebase/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
  }

  FutureOr<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterState());
    try {
      await FirebaseServices().register(event.email, event.password);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterErrorState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginState());
    try {
      await FirebaseServices().login(event.email, event.password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(errorMsg: e.toString()));
    }
  }
}
