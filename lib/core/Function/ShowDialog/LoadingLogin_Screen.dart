// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Widgets_Feda_Animation/Fade_Animation_Widget.dart';
import '../BottomSheet/RowPickImageFromC&G.dart';

void loading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Column(
          children: [
            LinearProgressIndicator(
              color: Colors.lightBlueAccent.shade700,
              backgroundColor: Colors.white,
              minHeight: 3,
            ),
            const Spacer(),
          ],
        ),
      );
    },
  );
}

