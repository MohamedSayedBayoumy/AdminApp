// ignore_for_file: non_constant_identifier_names, unnecessary_type_check, file_names, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../core/Function/ShowDialog/LoadingLogin_Screen.dart';
import '../../core/Function/SnakBar/snakbar_Screen.dart';
import '../../main.dart';
import 'BottomSheet_event.dart';
import 'BottomSheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(BottomSheetInitial()) {
    on<CreateFolderEvent>(_CreateFolderEvent);
  }


  Future InsertFolderInFireBase({
    required dynamic title,
    required dynamic image,
  }) async {

    final insertIntoDatabase = FirebaseFirestore.instance
        .collection('users')
        .doc(state.user!.uid.toString())
        .collection(state.user!.uid.toString())
        .doc(state.user!.uid.toString()).collection('AllData').doc();
    dynamic id =  insertIntoDatabase.id;
    prefs.setString('IdCurrentItem', id);
    await insertIntoDatabase.set(<String, dynamic>{
      'idCurrentFolder': id,
      'food': title,
      'image': image,
      'DataTime': DateTime.now(),
    });
  }


  Future sqliteAddFolder({
    required dynamic image,
    required dynamic food,
  }) async {
    FolderData.insert('folder', <String, dynamic>{
      'image': image,
      "food": food,
    });
  }



  Future<FutureOr<void>> _CreateFolderEvent(
      CreateFolderEvent event, Emitter<BottomSheetState> emit) async {
    if (event is CreateFolderEvent) {
      loading(event.context);
      emit(LoadingSendDataState());
      try {
        await sqliteAddFolder(image: event.image.toString() , food: event.title);
        Reference ref =FirebaseStorage.instance
            .ref()
            .child('ImagesFolder/${Uri.file(event.image ).pathSegments.last}');
        UploadTask upload = ref.putFile(File(event.image ));
        event.image = await (await upload).ref.getDownloadURL();
        print('ImageFirebase : ${event.image}') ;
        InsertFolderInFireBase(image: event.image, title: event.title);
        Navigator.pop(event.context);
        emit(SuccessCreateFolderState());
      } catch (e) {
        snack(event.context, Icons.info_outline,  e.toString() , true);
        emit(FaliureCreateFolderState(error: e.toString()));
      }
    }
  }

}
