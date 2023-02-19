// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../../AppBar_Categories/TitleAppBar.dart';
import '../../../drawer/CustomDrawer.dart';

class ErrorFetchDataScreen extends StatelessWidget {
  const ErrorFetchDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/warning.png',
            height: media.height * .2,
            width: media.width * .2,
          ),
          Container(
              alignment: Alignment.topCenter,
              width: media.width,
              height: media.height * .2,
              child: const Text(
                  "You Can't Add New Folder or Item While You are Offline"))
        ],
    );
  }
}
