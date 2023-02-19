import 'package:flutter/material.dart';
import 'package:untitled87/core/Function/BottomSheet/RowPickImageFromC&G.dart';

import '../../Widgets_Feda_Animation/Fade_Animation_Widget.dart';

void alertDialog(
  BuildContext ctx,
) {
  showDialog(
      context: ctx,
      builder: (context) {
        return fadeElasticIn(
          child: const AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Select Choice',
              style: TextStyle(fontFamily: 'Questrial'),
            ),
            scrollable: true,
            elevation: 1,
            content: RowGetImage(),
          ),
        );
      });
}
