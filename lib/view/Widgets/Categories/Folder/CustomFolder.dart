// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, use_build_context_synchronously, file_names, must_be_immutable, prefer_if_null_operators

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';
import '../../../../presentation/CurrentFolder_Screen/CurrentFolder_Offline_Screen.dart';
import '../../../../main.dart';
import '../../../../presentation/CurrentFolder_Screen/CurrentFolder_Online_Screen.dart';
import 'ContainerTitle.dart';

class DemoFile extends StatelessWidget {
  dynamic isDemo;
  dynamic OffLine;
  dynamic ImageFromFirebase;
  dynamic SqlLiteImage;
  dynamic FolderTitle;
  dynamic idCurrentFolder;

  DemoFile({
    Key? key,
    this.idCurrentFolder,
    required this.isDemo,
    required this.OffLine,
    required this.FolderTitle,
    this.ImageFromFirebase,
    this.SqlLiteImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return BlocBuilder<AdminAppBloc, AdminAppState>(builder: (context, state) {
      return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: media.width * .04, vertical: media.width * .02),
          child: fadeElasticIn(
            child: GestureDetector(
              onTap: isDemo == true
                  ? null
                  : OffLine == true
                      ? () async {
                          prefs.setString('FolderTitle', FolderTitle);
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: FetchDataFromSql(
                                      idCurrentFolder: idCurrentFolder,
                                      FoodTitle: FolderTitle),
                                  type: PageTransitionType.fade));
                        }
                      : () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CurrentFolder(
                                      idCurrentFolder: idCurrentFolder,
                                      FoodTitle: FolderTitle),
                                  type: PageTransitionType.fade));
                        },
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .11,
                    padding: EdgeInsets.symmetric(
                        horizontal: media.width * -0.0,
                        vertical: media.width * .02),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(
                            0.0,
                            10.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: -6.0,
                        ),
                      ],
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.35),
                          BlendMode.multiply,
                        ),
                        image: isDemo == true
                            ? bloc.state.image == null
                                ? const AssetImage('assets/image/Tuna.jpg')
                                : FileImage(File(bloc.state.image))
                                    as ImageProvider
                            : ImageFromFirebase == null
                                ? FileImage(File(SqlLiteImage)) as ImageProvider
                                : NetworkImage(ImageFromFirebase),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: ContainerTitle(title: FolderTitle, isDemo: isDemo),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
