// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../core/Widget_Button/ButtonWidget.dart';
import '../../../bloc/BottomSheet_bloc/BottomSheet_bloc.dart';
import '../../../bloc/BottomSheet_bloc/BottomSheet_event.dart';
import '../../../bloc/SelectChoose_bloc/select_choose_bloc.dart';

class ButtonToInsretFirebase extends StatelessWidget {
  const ButtonToInsretFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlocChoose = BlocProvider.of<SelectChooseBloc>(context);
    final BlocBottom = BlocProvider.of<BottomSheetBloc>(context);
    final BlocAdminApp = BlocProvider.of<AdminAppBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        generalButton(
            color: Colors.black87,
            onPressed: () {
              BlocBottom.add(CreateFolderEvent(
                  context: context,
                  image: BlocAdminApp.state.image ,
                  title: BlocChoose.state.SelectChoose.toString()));
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            horizontal: 15.0),
      ],
    );
  }
}
