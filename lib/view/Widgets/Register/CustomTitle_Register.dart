// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';



class TitleRegisterScreen extends StatelessWidget {
  const TitleRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fadeElasticIn(
      child: Column(
        children: [
          Image.asset('assets/image/Register.png' , height: 120,) ,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'fill in your data and be careful not to share with any one , it so that your data stays intact',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

