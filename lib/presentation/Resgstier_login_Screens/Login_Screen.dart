// ignore_for_file: camel_case_types, file_names

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../main.dart';
import '../../view/Widgets/Login/CustomRowNavigator.dart';
import '../../view/Widgets/Login/CustomTextFields.dart';
import '../../view/Widgets/Login/CustomTitle_Login.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(height: media.height * .16),
          const TitleLoginScreen(),
          SizedBox(height: media.height * .04),
          const WidgetsTextField(),
          const RowNavigatorToSingUp(),
          SizedBox(
            height: media.height * .01,
          ),
        ],
      ),
    );
  }
}
