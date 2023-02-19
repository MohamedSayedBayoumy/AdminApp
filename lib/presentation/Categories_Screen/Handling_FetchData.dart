// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'Offline_Screen.dart';
import 'Online_Screen.dart';
import '../../view/Widgets/Categories/FetchData/Offline_State/FetchDataFrom_Sql.dart';

class HandlingFetchData extends StatelessWidget {
  const HandlingFetchData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return const OnlineScreen();
        } else {
          return const handlingFetchDataFromSQl();
        }
      },
      child: const CircularProgressIndicator(
        color: Colors.redAccent,
      ),
    );
  }
}
