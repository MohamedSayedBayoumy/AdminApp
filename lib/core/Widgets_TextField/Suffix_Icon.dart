// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../presentation/UpdataItem_Screen/UpdataData.dart';

class CustomUpDataIcon extends StatelessWidget {
  TextEditingController controllerItemUpdating;
  dynamic labelText;
  dynamic maxLines;
  dynamic IdCurrentFolder;
  dynamic IdCurrentItem;
  dynamic IconPrefix;

  CustomUpDataIcon(
      {required this.labelText,
      required this.IdCurrentFolder,
      required this.IdCurrentItem,
      required this.controllerItemUpdating,
      required this.maxLines,
      required this.IconPrefix,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                child: UpdateData(
                  IconPrefix: IconPrefix,
                  IdCurrentFolder: IdCurrentFolder,
                  IdCurrentItem: IdCurrentItem,
                  maxLines: maxLines,
                  labelText: labelText,
                  controllerItemUpdating: controllerItemUpdating ,
                ),
                type: PageTransitionType.rightToLeft));
      },
      icon: const Icon(Icons.edit),
    );
  }
}
