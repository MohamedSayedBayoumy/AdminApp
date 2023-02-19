// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

import '../../../../../../main.dart';
import '../../../../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../../../../presentation/Categories_Screen/Offline_Screen.dart';
import '../../../AppBar_Categories/TitleAppBar.dart';
import '../../../drawer/CustomDrawer.dart';
import '../ErrorData/ErrorFetchData.dart';
import '../LoadUntilFetchData.dart';

class handlingFetchDataFromSQl extends StatelessWidget {
  const handlingFetchDataFromSQl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: NaturalAppBar(NeedLeading: true, child: const TitleAppBar()),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: FolderData.query('folder'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData== true) {
            if (snapshot.data.length == 0) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const ErrorFetchDataScreen();
                  });
            } else {
              return  const OfflineScreen();
            }
          } else {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const LoadingFetchData();
                });
          }
        },
      ),
    );
  }
}
