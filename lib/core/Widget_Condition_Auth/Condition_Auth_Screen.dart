// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/Resgstier_login_Screens/Login_Screen.dart';
import '../../presentation/Categories_Screen/Handling_FetchData.dart';

class ConditionScreen extends StatelessWidget {
  const ConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HandlingFetchData();
          } else {
            return const loginScreen();
          }
        },
      ),
    );
  }
}
