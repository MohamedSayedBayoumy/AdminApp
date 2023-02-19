// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_bloc.dart';

import '../../../core/Function/ShowDialog/AlertDialog.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return Container(
        child: GestureDetector(
      onTap: () {
        alertDialog(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: media.width * .2),
        child: Container(
          height: media.height * .30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black38,
          ),
          child: bloc.state.image == null
              ? const Text('Brand Logo')
              : Image.file(bloc.state.image, fit: BoxFit.cover),
        ),
      ),
    ));
  }
}
