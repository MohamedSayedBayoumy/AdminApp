// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../presentation/Resgstier_login_Screens/Register_Screen.dart';




class RowNavigatorToSingUp extends StatelessWidget {
  const RowNavigatorToSingUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Do you Have account ? ',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const RegisterScreen(),
                      type: PageTransitionType.rightToLeft));
            },
            child: const Text(
              'Signup',
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
