// ignore_for_file: file_names, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  dynamic isFolder ;
  EmptyDataWidget({required this.isFolder,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: media.height *.20,
        ),
        ElasticIn(
            child: Image.asset(
              'assets/image/add-to-cart.png',
              height: 200,
              color: Colors.grey,
            )),
          Text(
          "Let's Start Add New ${isFolder == true ? 'Folder' : 'Item'}",
          style: const TextStyle(color: Colors.grey, fontFamily: 'Ubuntu'),
        )
      ],
    );
  }
}