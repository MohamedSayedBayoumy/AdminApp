// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatelessWidget {

  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: media.height * .44,
      ),
      Text(
        'Mr.food',
        style: TextStyle(
            fontSize: 50,
            color: HexColor('362360'),
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w600),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'By Admin',
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            width: media.width * .398,
          )
        ],
      ),
      const Spacer(),
      Lottie.asset('assets/json/Composição.json', height: media.height*.085),
    ]);
  }
}
