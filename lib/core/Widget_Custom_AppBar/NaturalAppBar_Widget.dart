// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled87/main.dart';


class NaturalAppBar extends StatelessWidget implements PreferredSizeWidget {
  dynamic Title;
  dynamic color;
  dynamic colorText;
  dynamic elevation;
  dynamic NeedLeading;
  dynamic child;

  NaturalAppBar(
      {Key? key,
      this.Title,
      this.elevation,
      this.child,
      this.NeedLeading,
      this.color,
      this.colorText})
      : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(NeedLeading == false ? 60.0 : 80.0);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return AppBar(
      leading: NeedLeading == false
          ? null
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Image.asset(
                      'assets/image/menu.png',
                    ))
              ],
            ),
      toolbarHeight: 90,
      backgroundColor: NeedLeading == false
          ? Colors.indigo
          : Colors.indigo.shade300.withOpacity(.5),
      elevation: NeedLeading == false ? 15.0 : 0.0,
      title: NeedLeading == false
          ? Text(
              Title,
              style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            )
          : child,
    );
  }
}
