import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../main.dart';

class BodyDrawer extends StatelessWidget {
  const BodyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        bloc.state.UserData.addAll([
          Tile(
              Title: prefs.getString('username').toString(),
              Icon: const Icon(Icons.account_box_outlined)),
          Tile(
              Title: prefs.getString('email').toString(),
              Icon: const Icon(Icons.person)),
          Tile(
              Title: prefs.getString('password').toString(),
              Icon: const Icon(Icons.lock_open)),
          Tile(
              Title: prefs.getString('phone').toString(),
              Icon: const Icon(Icons.phone_android_outlined)),
        ]);
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: ListTile(
                selected: true,
                selectedColor: Colors.black,
                title: Text(bloc.state.UserData[index].Title.toString()),
                leading: bloc.state.UserData[index].Icon),
          ),
        );
      },
    );
  }
}
