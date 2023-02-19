// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled87/main.dart';

import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../core/Widget_FloatActionButton/CustomFloatingActionButton.dart';
import '../../view/Widgets/Current_Folder/EmptyData.dart';
import '../../view/Widgets/Current_Folder/GirdView/GridViewItem_Online.dart';
import '../../view/Widgets/Current_Folder/LoadingGridView.dart';
import '../AddNewItem_Screen/AddItem_Screen.dart';

class CurrentFolder extends StatelessWidget {
  dynamic idCurrentFolder;
  dynamic FoodTitle;

  CurrentFolder({
    Key? key,
    this.idCurrentFolder,
    this.FoodTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    bloc.image = null;
    return Scaffold(
      appBar:
          NaturalAppBar(NeedLeading: false, Title: FoodTitle),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(bloc.user!.uid)
                  .collection(bloc.user!.uid)
                  .doc(bloc.user!.uid)
                  .collection('AllData')
                  .doc(idCurrentFolder)
                  .collection(idCurrentFolder)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == true) {
                  if (snapshot.data.docs.length != 0) {
                    return GridViewItemOnline(
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
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatActionButton(
        isFloatToAddNewItem: true,
        onPressed: () async {
            Navigator.push(
              context,
              PageTransition(
                  child: AddItem(IdCurrentItem: idCurrentFolder),
                  type: PageTransitionType.bottomToTop));
        },
      ),
    );
  }
}
