// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../main.dart';
import 'CustomLogOut.dart';
import 'body_Drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Container(
          height: media.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      prefs.getString('imageFromFirebase').toString()),
                  fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [BodyDrawer(), CustomLogOut()])),
    );
  }
}
