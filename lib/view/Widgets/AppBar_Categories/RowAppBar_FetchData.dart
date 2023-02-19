// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';

class RowAppBarFetchData extends StatelessWidget {
  dynamic data;
  RowAppBarFetchData({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return fadeElasticIn(
        child: Container(
            width: media.width * .2,
            height: media.height * .3,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: media.width * .03),
            decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              data,
              style: const TextStyle(
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )));
  }
}
