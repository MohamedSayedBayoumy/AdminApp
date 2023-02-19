// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../Widgets_Feda_Animation/Fade_Animation_Widget.dart';

class CustomFloatActionButton extends StatelessWidget {
  dynamic isFloatToAddNewItem;
  final void Function()? onPressed;
  CustomFloatActionButton(
      {Key? key, required this.onPressed, required this.isFloatToAddNewItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return fadeDownToUp(
      child: FloatingActionButton(
          backgroundColor: Colors.indigo.shade700,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: isFloatToAddNewItem == true
              ? const Icon(Icons.add_shopping_cart)
              : Image.asset(
                  'assets/icons/plus.png',
                  color: Colors.white,
                  width: 25,
                )),
    );
  }
}
