// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../main.dart';
import 'RowAppBar_FetchData.dart';

class FetchAvailableItem extends StatelessWidget {
  const FetchAvailableItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      width: media.width,
      height: media.height * .08,
      margin: EdgeInsets.symmetric(vertical: media.height * .014),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Data')
              .orderBy('Time', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return RowAppBarFetchData(
                    data: snapshot.data.docs[index]['food'],
                  );
                },
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.indigo,
              ));
            }
          }),
    );
  }
}
