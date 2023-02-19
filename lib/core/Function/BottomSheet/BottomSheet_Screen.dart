// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_state.dart';
import 'package:untitled87/view/Widgets/Categories/Folder/CustomFolder.dart';

import 'DropList.dart';
import 'ButtonToInsertInFirebase.dart';
import 'RowPickImageFromC&G.dart';

Future showModel({
  required BuildContext ctx,
}) =>
    showModalBottomSheet<void>(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Wrap(
                  children: [
                    DemoFile(isDemo: true, FolderTitle: 'Pizza', OffLine: null),
                    const SizedBox(
                      height: 100,
                    ),
                    const RowGetImage(),
                    const DropList(),
                    const SizedBox(
                      height: 100,
                    ),
                    const ButtonToInsretFirebase(),
                  ],
                ));
          },
        );


