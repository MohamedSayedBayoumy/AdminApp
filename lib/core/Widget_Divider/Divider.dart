// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names, must_be_immutable

import 'package:flutter/material.dart';

class divider extends StatelessWidget {
  dynamic color ;
  divider({required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      width: media.width * .2,
      height: media.height * .001,
      color: color ,
    );
  }
}

