// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, library_prefixes, unnecessary_type_check, avoid_print, file_names

import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled87/presentation/Categories_Screen/Handling_FetchData.dart';

import '../../core/Function/SnakBar/snakbar_Screen.dart';
import '../../main.dart';
import '../../presentation/Resgstier_login_Screens/Login_Screen.dart';
import '../AdminApp_Bloc/AdminApp_state.dart';

part 'Auth_event.dart';
part 'Auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginWithAuthEvent>(_LoginWithAuth);
    on<RegisterEvent>(_RegisterWithEvent);
    on<AuthEvent>(_ShowPasswordEvent);
    on<LogOutEvent>(_LogOutEvent);
  }

  Future<void> GetData() async {
    final user = FirebaseAuth.instance.currentUser;
    dynamic id = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection(user.uid.toString())
        .doc(user.uid.toString())
        .get();
    prefs.setString('idAuth', id['idAuth']);
    prefs.setString('username', id['username']);
    prefs.setString('email', id['email']);
    prefs.setString('password', id['password']);
    prefs.setString('phone', id['phone']);
    prefs.setString('imageFromFirebase', id['imageToFirebase']);
    print(prefs.getString('idAuth'));
    print(prefs.getString('username'));
    print(prefs.getString('email'));
    print(prefs.getString('password'));
    print(prefs.getString('phone'));
    print(prefs.getString('imageFromFirebase'));
  }

  Future<void> Login({
    required dynamic email,
    required dynamic password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future<FutureOr<void>> _LoginWithAuth(
      AuthEvent event, Emitter<AuthState> emit) async {
    if (event is LoginWithAuthEvent) {
      if (event.Key.currentState!.validate()) {
        print(event.email);
        print(event.password);
        emit(LoadingStateSingIn(IsLoading: state.WidgetLoading = true));
        try {
          await Login(
              email: event.email.trim(), password: event.password.trim());
          GetData();
          Navigator.pushAndRemoveUntil(
              event.context,
              PageTransition(
                  child: const HandlingFetchData(),
                  type: PageTransitionType.rightToLeft),
              (route) => false);
          emit(SuccessSingInWithAuthState());
        } on FirebaseAuthException catch (e) {
          state.formKeyLogin = event.Key ;
          print(e.message.toString());
          snack(event.context, Icons.error_outline, e.message.toString(), true);
          emit(FaliureSingInWithAuthState(e.message.toString() ,event.Key));
        }
      } else {}
    } else {}
  }

  Future<void> RegisterWithFireBase({
    required dynamic username,
    required dynamic email,
    required dynamic password,
    required dynamic phone,
    required dynamic Brand,
    required dynamic imageToFirebase,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final insertIntoDatabase = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid.toString())
        .collection(user.uid.toString())
        .doc(user.uid.toString());
    insertIntoDatabase.set(<String, dynamic>{
      'idAuth': user.uid.toString(),
      'username': username.trim(),
      'Brand': Brand.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'phone': phone.trim(),
      'imageToFirebase': imageToFirebase.trim(),
    });
  }

  Future<FutureOr<void>> _RegisterWithEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    if (state.fromKeyRegister.currentState!.validate()) {
      if (event is RegisterEvent) {
        emit(LoadingStateRegister(IsLoading: true));
        try {
          Reference ref = FirebaseStorage.instance
              .ref()
              .child('users/${Uri.file(event.image).pathSegments.last}');
          print('imageBefore : ${event.image}');
          UploadTask upload = ref.putFile(File(event.image));
          event.image = await (await upload).ref.getDownloadURL();
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email.trim(),
            password: event.password.trim(),
          );
           RegisterWithFireBase(
            username: event.username.trim(),
            email: event.email.trim(),
            password: event.password.trim(),
            Brand: event.Brand.trim(),
            phone: event.phone.trim(),
            imageToFirebase: event.image.toString(),
          );
           GetData();
           Navigator.pushAndRemoveUntil(
              event.context,
              PageTransition(
                  child: const HandlingFetchData(),
                  type: PageTransitionType.rightToLeft),
              (route) => false);
          emit(SuccessRegisterWithState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            snack(event.context, Icons.info_outline,
                'The password provided is too weak.', true);
            emit(FaliureSingInWithAuthState(
                'The password provided is too weak.' , null));
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            snack(event.context, Icons.info_outline,
                'The account already exists for that email.', true);
            emit(FaliureSingInWithAuthState(
                'The account already use for other email.' , null));
          }
        } catch (e) {
          print(e);
        }
      }
    } else {}
  }

  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   if (event. is DoSomething) {
  //     // If fetchSomething() takes a while, it will block the
  //     // internal event queue, preventing other events from firing.
  //     final results = await repo.fetchSomething();
  //     yield MyState(results: results);
  //   }
  // }

  Stream<AuthState> _ShowPasswordEvent(
      AuthEvent event, Emitter<AuthState> yield) async* {
    if (event is ShowPasswordEvent) {
      try {
        if (event.iconData == Icons.visibility_outlined) {
          event.iconData = Icons.visibility_off_outlined;
          yield ShowPasswordState(icon: event.iconData);
        } else if (event.iconData == Icons.visibility_off_outlined) {
          event.iconData = Icons.visibility_outlined;
          yield (DisAppearPasswordState(icon: event.iconData));
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<FutureOr<void>> _LogOutEvent(
      LogOutEvent event, Emitter<AuthState> emit) async {
    if (event is LogOutEvent) {
      emit(LoadingLogOutState());
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
            event.context,
            PageTransition(
                child: const loginScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);

        emit(SuccessLogOutState());
      } catch (e) {
        emit(FaliureLogOutState(Error: e.toString()));
      }
    }
  }
}
