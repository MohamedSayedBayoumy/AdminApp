// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import '../../../../main.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: media.height * .001),
        Text(
          'Welcome ${prefs.getString('username').toString()}',
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Questrial'),
        ),
        SizedBox(height: media.height * .0019),
      ],
    );
  }
}
