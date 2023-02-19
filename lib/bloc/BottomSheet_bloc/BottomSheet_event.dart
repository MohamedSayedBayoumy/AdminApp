// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
abstract class BottomSheetEvent {}

class CreateFolderEvent extends BottomSheetEvent{
  dynamic image ;
  dynamic title ;
  dynamic context ;

  CreateFolderEvent({ required this.image ,required this.context , required this.title});
}

class PickImageFromGalleryEventt extends BottomSheetEvent {
  dynamic context ;
  PickImageFromGalleryEventt({required this.context}) ;
}

class PickImageFromCameraEventt extends BottomSheetEvent {
  dynamic context ;
  PickImageFromCameraEventt({required this.context}) ;
}

