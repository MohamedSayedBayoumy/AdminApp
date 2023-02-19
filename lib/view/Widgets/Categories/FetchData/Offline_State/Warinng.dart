import 'package:flutter/material.dart';

import '../../../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';

class WarningMassage extends StatelessWidget {
  const WarningMassage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return fadeElasticIn(
        child: Container(
      alignment: Alignment.center,
      width: media.width,
      height: media.height * .05,
      color: Colors.redAccent.shade700,
      child: Row(
        children: [
          SizedBox(width: media.width*.01,) ,
          const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          SizedBox(width: media.width*.02,) ,
            Text(
              "Now Are Your Offline in This Situation You Can't Add or Update any Item ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700 , fontSize: media.width*0.0275)),
        ],
      ),
    ));
  }
}
