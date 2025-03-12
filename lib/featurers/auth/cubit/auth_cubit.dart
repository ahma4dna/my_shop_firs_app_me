import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      await Supabase.instance.client.auth.signUp(
        password: password,
        email: email,
      );
      emit(SignUpSucces());
    } catch (e) {
      log(e.toString());
      emit(SignUpErorr());
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      emit(LoginSucces());
    } catch (e) {
      log(e.toString());
      emit(LoginErorr());
    }
  }

  Future<void> loginWithGoogleProvder() async {
    emit(LoginGoogleLoading());

    try {
      final google = GoogleSignIn(
        serverClientId:
            "936513099483-fl5n89soh7mfi8q5563im8278clkic9i.apps.googleusercontent.com",
      );
      await google.signOut();
      final acountGoogle = await google.signIn();
      if (acountGoogle != null) {
        final auth = await acountGoogle.authentication;
        if (auth.accessToken != null && auth.idToken != null) {
          final accessToken = auth.accessToken;
          final idToken = auth.idToken;
          await Supabase.instance.client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken!,
            accessToken: accessToken,
          );
          emit(LoginGoogleSucces());
        }
      }
    } catch (e) {
      log(e.toString());
      emit(LoginGoogleErorr());
    }
  }
}
