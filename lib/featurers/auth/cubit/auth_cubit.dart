import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/featurers/auth/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    emit(SignUpLoading());
    try {
      await Supabase.instance.client.auth.signUp(
        password: password,
        email: email,
      );

      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        log("User is null after signup!");
        emit(SignUpErorr());
        return;
      }

      await saveDataAuthUser(email: email, name: name);

      emit(SignUpSucces());
    } catch (e) {
      log(e.toString());
      emit(SignUpErorr());
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        log("User is null after login!");
        emit(LoginErorr());
        return;
      }

      emit(LoginSucces());
    } catch (e) {
      log(e.toString());
      emit(LoginErorr());
    }
  }

  Future<void> loginWithGoogleProvder({required BuildContext context}) async {
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
          await Supabase.instance.client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: auth.idToken!,
            accessToken: auth.accessToken!,
          );

          final user = Supabase.instance.client.auth.currentUser;
          if (user == null) {
            log("User is null after Google login!");
            emit(LoginGoogleErorr());
            return;
          }

          final isNewuser = await Supabase.instance.client
              .from("users")
              .select()
              .eq("id_user", user.id)
              .maybeSingle();

          if (isNewuser == null) {
            await saveDataAuthUser(
              email: acountGoogle.email,
              name: acountGoogle.displayName!,
            );
          }
          emit(LoginGoogleSucces());
        }
      }
    } catch (e) {
      log(e.toString());
      emit(LoginGoogleErorr());
    }
  }

  Future<void> saveDataAuthUser(
      {required String email, required String name}) async {
    emit(SaveDataLoading());
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        log("User is null when saving data!");
        emit(SaveDataErorr());
        return;
      }

      await Supabase.instance.client.from("users").insert({
        "id_user": user.id,
        "name": name,
        "email": email,
      });

      emit(SaveDataSuceccs());
    } catch (e) {
      emit(SaveDataErorr());
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    emit(SignOutLoading());
    try {
      await Supabase.instance.client.auth.signOut();

      emit(SignOutSucecc());

      // تعديل التوجيه بعد تسجيل الخروج
    } catch (e) {
      emit(SignOutErorr());
    }
  }

  List<UserModel> lisUser = [];

  UserModel? userModel;
  Future<void> getDataUser({required BuildContext context}) async {
    emit(GetDataUserLoading());
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        // التعامل مع حالة عدم وجود المستخدم
        emit(GetDataUserErorr());
        return;
      }

      final data = await Supabase.instance.client
          .from("users")
          .select()
          .eq("id_user", user.id);

      if (data.isNotEmpty) {
        lisUser.add(UserModel.fromJson(data.first));
      } else {
        // التعامل مع حالة عدم وجود بيانات
        emit(GetDataUserErorr());
        return;
      }

      if (lisUser.isNotEmpty) {
        userModel = lisUser[0];
        if (userModel != null && userModel!.name != null) {
          log(userModel!.name!);
        } else {
          log("User name is null");
        }
      }

      emit(GetDataUserSucecc());
    } catch (e) {
      emit(GetDataUserErorr());
    }
  }
}
