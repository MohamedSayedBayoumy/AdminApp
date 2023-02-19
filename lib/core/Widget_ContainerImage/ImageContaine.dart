// ignore_for_file: unnecessary_null_comparison, must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../Function/ShowDialog/AlertDialog.dart';
import '../Widget_TextChangeImage/TextChangeImage.dart';

class ContainerImage extends StatelessWidget {
  dynamic state ;
  ContainerImage( { required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          alertDialog(context);
        },
        child:
        BlocBuilder<AdminAppBloc, AdminAppState>(
          buildWhen: state == true ? (previous, current) {
            return current is State ;
          } : null ,
          builder: (context, state) {
            return Container(
              width: media.width * .2,
              height: media.height * .5,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: media.height * .01),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  image: DecorationImage(
                      image: bloc.state.imageFromDatabase == null
                          ? bloc.state.image == null
                              ? const AssetImage('assets/image/image.png')
                              : FileImage(File(bloc.state.image)) as ImageProvider
                          : NetworkImage(bloc.state.imageFromDatabase),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadiusDirectional.circular(25)),
              child: const RowText(),
            );
          },
        ),
      ),
    );
  }
}
