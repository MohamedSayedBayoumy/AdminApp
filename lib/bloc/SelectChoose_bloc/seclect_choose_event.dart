
import 'package:flutter/material.dart';

@immutable
abstract class SelectChooseEvent {}


class choose extends SelectChooseEvent {
  dynamic value;
  choose({required this.value});
}