// ignore_for_file: file_names

import 'package:flutter/material.dart';

void snack(
  BuildContext ctx,
  IconData icon,
  String msg,
  dynamic color,
) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      backgroundColor:
          color == true ? Colors.redAccent.shade700 : Colors.green.shade700,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.fixed,
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),

          Container(
              height: MediaQuery.of(ctx).size.height * .041,
              width: MediaQuery.of(ctx).size.width * .8,
              alignment: Alignment.centerLeft,
              child: Text(
                msg,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(fontFamily: 'Questrial'),
              )),
        ],
      )));
}
