// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';

class ShapeItem extends StatelessWidget {
  dynamic ImageFromFirebase;
  dynamic ImageFromSQl;
  dynamic Food;
  ShapeItem({  this.ImageFromFirebase, this.ImageFromSQl,required this.Food, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      width: media.width * .37,
      height: media.height * .3,
      // margin: EdgeInsets.only(top: media.height * .009),
      decoration: BoxDecoration(
        color: Colors.black38,
        image: DecorationImage(
            image: ImageFromFirebase == null
                ?ImageFromSQl == null ? const AssetImage('assets/image/cutlery.png') : FileImage(File(ImageFromSQl)) as ImageProvider
                : NetworkImage(ImageFromFirebase),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: media.width * .80,
          height: media.height * .04,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.4),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8)),
          ),
          child: Text(Food ?? 'Loading .. ',
              style: const TextStyle(fontFamily: 'Questrial' , fontWeight: FontWeight.w800)),
        )
      ]),
    );
  }
}
