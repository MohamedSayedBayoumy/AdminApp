// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'AppBar_FetchAvialable_Items.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
        width: media.width * .5,
        height: media.height * .14,
        padding: EdgeInsets.symmetric(horizontal: media.width * .008),
        alignment: Alignment.topLeft,
        color: Colors.indigo.shade300.withOpacity(.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Now you Can Add your Item , in',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Questrial'),
            ),
            FetchAvailableItem(),
          ],
        ));
  }
}
