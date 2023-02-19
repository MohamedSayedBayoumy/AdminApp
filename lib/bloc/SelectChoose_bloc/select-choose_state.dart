
 // ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

@immutable
abstract class SelectChooseState {

  List<String> lop = [];

  dynamic SelectChoose   ;
  void Onchange(String? value){
    if(value is String){
      SelectChoose = value ;
    }
  }
}

class SelectChooseInitial extends SelectChooseState {}


class Loading extends SelectChooseState{}


class Success extends SelectChooseState{
  dynamic value ;
  Success({required this.value}) ;
}
class Faliure extends SelectChooseState{
  dynamic value ;
  Faliure({required this.value}) ;
}
