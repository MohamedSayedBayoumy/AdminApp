// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';



class TitleLoginScreen extends StatelessWidget {
  const TitleLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fadeElasticIn(
      child: Column(
        children: [
          Image.asset(
            'assets/image/login.png',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Ubuntu'),
                children: <TextSpan>[
                  const TextSpan(
                      text:
                      'This application is for marketing and company only, and should not be shared with anyone except by',
                      style: TextStyle(color: Colors.black, fontSize: 10)),
                  TextSpan(
                      text: ' consulting the administrators!',
                      style:
                      TextStyle(color: Colors.red.shade700, fontSize: 15)),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
