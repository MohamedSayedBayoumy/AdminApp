// ignore_for_file: avoid_print, unnecessary_type_check, non_constant_identifier_names, depend_on_referenced_packages, file_names

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/Function/ShowDialog/LoadingLogin_Screen.dart';
import '../../core/Function/SnakBar/snakbar_Screen.dart';
import '../../main.dart';
import '../../view/Widgets/AppBar_Categories/RowAppBar_FetchData.dart';
import 'AdminApp_event.dart';
import 'AdminApp_state.dart';

class AdminAppBloc extends Bloc<AdminAppEvent, AdminAppState> {
  AdminAppBloc() : super(AdminAppInitial()) {
    on<AddNewItemEvent>(_AddNewItemEvent);
    on<UpdateDateEvent>(_UpdateDateEvent);
    on<PickImageFromGalleryEvent>(_PickImageFromGalleryEvent);
    on<PickImageFromCameraEvent>(_PickImageFromCameraEvent);
  }





  Future<void> GetItemForDropList() async {
    state.lop.clear() ;
    prefs.setStringList('ListChoose',[]);
    CollectionReference collect = FirebaseFirestore.instance.collection('Data') ;
    await collect.get().then((QuerySnapshot snapshot)  {
      snapshot.docs.forEach((element) { state.lop.addAll([(element.data() as dynamic )['food'].toString() ]);});
      prefs.setStringList('ListChoose', state.lop) ;
      print('hi  : ${state.lop}'); });
  }


  Future<void> FetchUserData() async {
    CollectionReference collect =
    FirebaseFirestore.instance.collection('users');
    await collect
        .doc(state.user!.uid.toString())
        .collection(state.user!.uid.toString())
        .doc(state.user!.uid.toString())
        .get()
        .then((value) {
      prefs.setString('username', value['username']);
      print('hi  : ${value['username']}');
    });
  }

  Future<void> InsertInFirebase({
    required dynamic id,
    required dynamic Food,
    required dynamic Price,
    required dynamic DescriptionAr,
    required dynamic DescriptionEn,
    required dynamic image,
  }) async {
    final AddNewItemToFireBase = FirebaseFirestore.instance
        .collection('users')
        .doc(state.user!.uid.toString())
        .collection(state.user!.uid.toString())
        .doc(state.user!.uid.toString())
        .collection('AllData')
        .doc(id)
        .collection(id)
        .doc();
    String NewIdCurrentItem = AddNewItemToFireBase.id.toString();
    AddNewItemToFireBase.set(<String, dynamic>{
      'Food': Food,
      'Price': Price + ' LE',
      'DescriptionAr': DescriptionAr,
      'DescriptionEn': DescriptionEn,
      'image': image,
      'IDCurrentItem': NewIdCurrentItem.toString(),
    });
  }

  Future sqliteAddItems({
    required dynamic image,
    required dynamic food,
    required dynamic Price,
    required dynamic DescriptionAr,
    required dynamic DescriptionEn,
  }) async {
    ItemData.insert('Item', <String, dynamic>{
      "Image": image,
      "Food": food,
      "Price": Price,
      "DescriptionAr": DescriptionAr,
      "DescriptionEn": DescriptionEn,
    });
  }

  Future<FutureOr<void>> _AddNewItemEvent(
      AddNewItemEvent event, Emitter<AdminAppState> emit) async {
    if (state.formKey.currentState!.validate()) {
      if (event is AddNewItemEvent) {
        emit(LoadingAddNewItemState(IsLoading: true));
        try {
          await sqliteAddItems(
              food: event.Food,
              image: event.image,
              DescriptionEn: event.DescriptionEn,
              DescriptionAr: event.DescriptionAr,
              Price: event.Price);
          Reference ref = FirebaseStorage.instance
              .ref()
              .child('imageItems/${Uri.file(event.image).pathSegments.last}');
          UploadTask upload = ref.putFile(File(event.image));
          event.image = await (await upload).ref.getDownloadURL();
          await InsertInFirebase(
              id: event.IdCurrentItem,
              Food: event.Food,
              Price: event.Price,
              DescriptionAr: event.DescriptionAr,
              DescriptionEn: event.DescriptionEn,
              image: event.image);
          emit(SuccessAddNewItemState(value: event.Controller));
        } catch (e) {
          snack(event.context, Icons.info, e.toString(), true);
          FaliureAddNewItemState();
        }
      }
    } else {}
  }

  Future<void> Update({
    required dynamic IdCurrentFolder,
    required dynamic labelText,
    required dynamic IdCurrentItem,
    required TextEditingController ControllerDateUpdate,
  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(state.user!.uid.toString())
        .collection(state.user!.uid.toString())
        .doc(state.user!.uid.toString())
        .collection('AllData')
        .doc(IdCurrentFolder)
        .collection(IdCurrentFolder)
        .doc(IdCurrentItem)
        .update(<String, dynamic>{
      '$labelText': ControllerDateUpdate.text,
    });
  }

  Future<FutureOr<void>> _UpdateDateEvent(
      UpdateDateEvent event, Emitter<AdminAppState> emit) async {
    if (event is UpdateDateEvent) {
      snack(event.context, Icons.info, ' Wait', true);
      emit(LoadingUpdate());
      try {
        ItemData.update('Item',<String, dynamic>{event.StringItem : event.ControllerDateUpdate.text.toString()}) ;
        await Update(
          IdCurrentFolder: event.IdCurrentFolder,
          IdCurrentItem: event.IdCurrentItem,
          labelText: event.StringItem,
          ControllerDateUpdate: event.ControllerDateUpdate,
        );
        snack(event.context, Icons.info, ' Done', false);
        emit(SuccessUpdate());
      } catch (e) {
        Navigator.pop(event.context);
        FaliureUpdate(Error: e.toString());
      }
    }
  }

  Future<FutureOr<void>> _PickImageFromGalleryEvent(
      PickImageFromGalleryEvent event, Emitter<AdminAppState> emit) async {
    if (event is PickImageFromGalleryEvent) {
      emit(LoadingPickPickImageState());
      try {
        final MyFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        state.file = File(MyFile!.path);
        state.image = state.file!.path;
        print('ImageState : ${state.image}');
        emit(SuccessPickImageFromGalleryState(state.image));
      } catch (e) {
        Navigator.pop(event.context);
        emit(FaliurePickImageState(e.toString()));
      }
    }
  }

  Future<FutureOr<void>> _PickImageFromCameraEvent(
      PickImageFromCameraEvent event, Emitter<AdminAppState> emit) async {
    if (event is PickImageFromCameraEvent) {
      emit(LoadingPickPickImageState());
      try {
        final MyFile =
            await ImagePicker().pickImage(source: ImageSource.camera);
        state.file = File(MyFile!.path);
        state.image = state.file;
        print('ImageState : ${state.image}');
        emit(SuccessPickImageFromCameraState(state.image));
      } catch (e) {
        Navigator.pop(event.context);
        emit(FaliurePickImageState(e.toString()));
      }
    }
  }

  // Future<void> changePasseord(BuildContext ctx) async {
  //   prefs = await SharedPreferences.getInstance();
  //   final user = FirebaseAuth.instance.currentUser;
  //   try {
  //     await user?.updatePassword(UpdatePassWord.text);
  //     final lol = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(prefs.getString('idAuth'));
  //     lol.update(<String, dynamic>{
  //       'password': UpdatePassWord.text,
  //     });
  //   } on FirebaseException catch (e) {
  //     snack(ctx, Icons.info_outline, e.message.toString());
  //   }
  //   emit(ChangePassword());
  // }

}
