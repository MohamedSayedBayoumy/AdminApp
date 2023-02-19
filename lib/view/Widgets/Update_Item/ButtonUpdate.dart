// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_event.dart';
import '../../../core/Widget_Button/ButtonWidget.dart';

// ignore: must_be_immutable
class ButtonUpdate extends StatelessWidget {
  TextEditingController controllerItemUpdating;
  dynamic labelText;
  dynamic maxLines;
  dynamic IdCurrentFolder;
  dynamic IdCurrentItem;
  ButtonUpdate(
      {required this.labelText,
      required this.IdCurrentFolder,
      required this.IdCurrentItem,
      required this.controllerItemUpdating,
      required this.maxLines,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        generalButton(
            horizontal: media.width * .02,
            width: media.width * .2,
            onPressed: () {
              bloc.add(UpdateDateEvent(
                  context: context,
                  StringItem: labelText,
                  ControllerDateUpdate: bloc.state.UpdateController,
                  IdCurrentItem: IdCurrentItem,
                  IdCurrentFolder: IdCurrentFolder));
            },
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
