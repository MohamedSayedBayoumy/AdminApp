// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget generalButton(
        {required void Function()? onPressed,
        required dynamic child,
        dynamic elevation,
        dynamic color,
        dynamic width,
        double? horizontal,
        dynamic height}) =>
    Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: horizontal!),
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
        ));
