// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/main.dart';

import '../../../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../../../view/Widgets/Current_Folder/EmptyData.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../view/Widgets/Current_Folder/LoadingGridView.dart';
import '../../core/Function/SnakBar/snakbar_Screen.dart';
import '../../view/Widgets/Current_Folder/GirdView/GirdViewItem_Offline.dart';

class FetchDataFromSql extends StatelessWidget {
  dynamic idCurrentFolder;
  dynamic FoodTitle;

  FetchDataFromSql({
    Key? key,
    this.idCurrentFolder,
    this.FoodTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    bloc.image = null;
    return FutureBuilder(
      future: ItemData.query('Item'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == true) {
          if (snapshot.data.length != 0) {
            return GridViewItemOffline(
              snapshot: snapshot,
              id: idCurrentFolder,
            );
          } else {
            return EmptyDataWidget(
              isFolder: false,
            );
          }
        } else {
          return const LoadingGirdView();
        }
      },
    );
  }
}
