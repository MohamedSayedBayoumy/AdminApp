// ignore_for_file: must_be_immutable, non_constant_identifier_names, duplicate_ignore

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart' ;

@immutable
abstract class BottomSheetState {

  dynamic SelectChoose ;
  dynamic Defalt ;
  final user = FirebaseAuth.instance.currentUser;


  File? file  ;
  dynamic image ;
  dynamic Id = 0 ;

  dynamic isDemo = false ;
  dynamic NeedLineText ;
  TextEditingController AddNewTitleFolder = TextEditingController();

}
class BottomSheetInitial extends BottomSheetState {}

class LoadingSendDataState extends BottomSheetState{
  dynamic image ;

}

class SuccessCreateFolderState extends BottomSheetState{}

class FaliureCreateFolderState extends BottomSheetState{
  dynamic error ;
  FaliureCreateFolderState({required this.error}) ;
}




class LoadingPickPickImageState extends BottomSheetState {}

class SuccessPickImageFromGalleryState extends BottomSheetState {
  dynamic image ;
  SuccessPickImageFromGalleryState(this.image);
}

class SuccessPickImageFromCameraState extends BottomSheetState {
  dynamic image ;

  SuccessPickImageFromCameraState(this.image);
}

class FaliurePickImageState extends BottomSheetState {
  dynamic error ;

  FaliurePickImageState(this.error);
}

//
// class Loading extends BottomSheetState{}
//
//
// class Success extends BottomSheetState{
//   dynamic value ;
//   Success({required this.value}) ;
// }
// class Faliure extends BottomSheetState{
//   dynamic value ;
//   Faliure({required this.value}) ;
// }
//
