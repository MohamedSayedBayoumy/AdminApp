// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../view/Widgets/AppBar_Categories/TitleAppBar.dart';
import '../../view/Widgets/Categories/FetchData/Offline_State/Warinng.dart';
import '../../view/Widgets/drawer/CustomDrawer.dart';
import '../CurrentFolder_Screen/CurrentFolder_Offline_Screen.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [const WarningMassage(), FetchDataFromSql()],
    );
  }
}
