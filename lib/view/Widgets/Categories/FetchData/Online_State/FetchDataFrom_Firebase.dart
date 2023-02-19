// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../../../main.dart';
import '../../../Current_Folder/EmptyData.dart';
import '../../Folder/CustomFolder.dart';
import '../LoadUntilFetchData.dart';

class FetchDataFroMFirebase extends StatelessWidget {
  const FetchDataFroMFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(bloc.state.user!.uid.toString())
            .collection(bloc.state.user!.uid.toString())
            .doc(bloc.state.user!.uid.toString())
            .collection('AllData')
            .orderBy('DataTime')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length != 0) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    prefs.setString('idCurrentFolder', snapshot.data.docs[index]["idCurrentFolder"]) ;
                    return DemoFile(
                        isDemo: false,
                        OffLine: false ,
                        ImageFromFirebase: snapshot.data.docs[index]["image"].toString(),
                        idCurrentFolder: snapshot.data.docs[index]["idCurrentFolder"],
                        FolderTitle: snapshot.data.docs[index]["food"].toString());
                  });
            } else {
              return EmptyDataWidget(isFolder: true);
            }
          } else {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const LoadingFetchData();
                });
          }
        });
  }
}
