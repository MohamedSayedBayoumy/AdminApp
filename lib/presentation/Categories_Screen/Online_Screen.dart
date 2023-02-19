// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../core/Function/BottomSheet/BottomSheet_Screen.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../core/Widget_FloatActionButton/CustomFloatingActionButton.dart';
import '../../view/Widgets/AppBar_Categories/AppBarView.dart';
import '../../view/Widgets/AppBar_Categories/TitleAppBar.dart';
import '../../view/Widgets/Categories/FetchData/Online_State/FetchDataFrom_Firebase.dart';
import '../../view/Widgets/drawer/CustomDrawer.dart';

class OnlineScreen extends StatelessWidget {
  const OnlineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    bloc.state.image = null ;
    return BlocBuilder<AdminAppBloc ,AdminAppState>(
      bloc: AdminAppBloc()..GetItemForDropList()..FetchUserData(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: NaturalAppBar(NeedLeading: true, child: const TitleAppBar()),
          drawer: const CustomDrawer(),
          body: ListView(
            shrinkWrap: true,
            children: const [
              AppBarView(),
              FetchDataFroMFirebase(),
            ],
          ),
          floatingActionButton: CustomFloatActionButton(
              isFloatToAddNewItem: false,
              onPressed: () {
                showModel(ctx: context) ;
              }),
        );

      },
    );
  }
}
