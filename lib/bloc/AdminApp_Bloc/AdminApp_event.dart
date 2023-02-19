// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';

@immutable
abstract class AdminAppEvent {}

class Data extends AdminAppEvent {}


class AddNewItemEvent extends AdminAppEvent {
  dynamic context;
  dynamic image;
  dynamic Food;
  dynamic Price;
  dynamic DescriptionEn;
  dynamic DescriptionAr;
  dynamic IdCurrentItem;
  TextEditingController Controller;
  AddNewItemEvent({
    required this.context,
    required this.image,
    required this.Food,
    required this.IdCurrentItem,
    required this.Price,
    required this.Controller,
    required this.DescriptionEn,
    required this.DescriptionAr,
  });
}

class TranslateEvent extends AdminAppEvent {
  dynamic title;
  TranslateEvent(this.title);
}

class OnValueChanged extends AdminAppEvent {
  final String input;
  OnValueChanged(this.input);
}

class UpdateDateEvent extends AdminAppEvent {
  dynamic context;
  dynamic StringItem;
  dynamic IdCurrentItem;
  dynamic IdCurrentFolder;
  TextEditingController ControllerDateUpdate;

  UpdateDateEvent({
    required this.context,
    required this.ControllerDateUpdate,
    required this.StringItem,
    required this.IdCurrentItem,
    required this.IdCurrentFolder,
  });


}

class PickImageFromGalleryEvent extends AdminAppEvent {
  dynamic context ;
  PickImageFromGalleryEvent({required this.context}) ;
}

class PickImageFromCameraEvent extends AdminAppEvent {
  dynamic context ;
  PickImageFromCameraEvent({required this.context}) ;
}


