// ignore_for_file: must_be_immutable, non_constant_identifier_names, overridden_fields, annotate_overrides, file_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

@immutable
abstract class AdminAppState {
  File? file;
  dynamic image;

  dynamic imageFromDatabase;

  dynamic index;

  dynamic WidgetLoading = false;



  TextEditingController food = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController DescriptionInEn = TextEditingController();
  TextEditingController DescriptionInAr = TextEditingController();

  TextEditingController CurrentFood = TextEditingController();
  TextEditingController CurrentPrice = TextEditingController();
  TextEditingController CurrentDescriptionInEn = TextEditingController();
  TextEditingController CurrentDescriptionInAr = TextEditingController();


  TextEditingController clear = TextEditingController();

  TextEditingController UpdateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final user = FirebaseAuth.instance.currentUser;

  late String? Function(String?) valid;

  List<String > lop = [];

  void Add(){
    prefs.setStringList('ListChoose' ,[]) ;
    prefs.setStringList('ListChoose' , lop);
    print('Bottom : ${prefs.getStringList('ListChoose')}') ;

  }

  ErrorPublic(TextEditingController controller,
      {required String? val, required String ErrorSpace}) {
    if (val!.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    return null;
  }
}

class AdminAppInitial extends AdminAppState {}

class LoadingTranslateState extends AdminAppState {}

class SuccessTranslateState extends AdminAppState {}

class FaliureTranslateState extends AdminAppState {
  dynamic error;
  FaliureTranslateState({required this.error});
}

class LoadingData extends AdminAppState {}

class LoadedData extends AdminAppState {}

class FaliureData extends AdminAppState {
  dynamic value;
  FaliureData({required this.value});
}

class LoadingAddNewItemState extends AdminAppState {
  dynamic IsLoading ;
  LoadingAddNewItemState({required this.IsLoading}) ;
}

class SuccessAddNewItemState extends AdminAppState {
  TextEditingController value;
  SuccessAddNewItemState({required this.value});
}

class FaliureAddNewItemState extends AdminAppState {}

class LoadingUpdate extends AdminAppState {}

class SuccessUpdate extends AdminAppState {}

class FaliureUpdate extends AdminAppState {
  dynamic Error;
  FaliureUpdate({required this.Error});
}

class Tile {
  dynamic Icon;
  dynamic Title;
  Tile({required this.Icon, required this.Title});
}

class Controller {
  TextEditingController controller;
  Controller({required this.controller});
}

class GetImageInitial extends AdminAppState {}

class LoadingPickPickImageState extends AdminAppState {}

class SuccessPickImageFromGalleryState extends AdminAppState {
  dynamic image;
  SuccessPickImageFromGalleryState(this.image);
}

class SuccessPickImageFromCameraState extends AdminAppState {
  dynamic image;

  SuccessPickImageFromCameraState(this.image);
}

class FaliurePickImageState extends AdminAppState {
  dynamic error;

  FaliurePickImageState(this.error);
}
