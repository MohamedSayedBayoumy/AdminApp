// ignore_for_file: must_be_immutable, prefer_if_null_operators, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled87/core/Widgets_TextField/TextField_Screen.dart';

import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../view/Widgets/Update_Item/ButtonUpdate.dart';

class UpdateData extends StatelessWidget {
  TextEditingController controllerItemUpdating;
  dynamic labelText;
  dynamic maxLines;
  dynamic IdCurrentFolder;
  dynamic IdCurrentItem;
  dynamic IconPrefix;
  UpdateData(
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
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    final media = MediaQuery.of(context).size;
    bloc.UpdateController.text = controllerItemUpdating.text;
    return Scaffold(
          appBar: NaturalAppBar(
            Title: 'Update $labelText',
            NeedLeading: false,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: media.width * 0000, vertical: media.height * .03),
            child: ListView(
              shrinkWrap: true,
              children: [
                customTextForm(
                  prefixIcon: IconPrefix ,
                  suffixIcon : false ,
                  border: const UnderlineInputBorder(),
                  labelText: '$labelText',
                  theme: Colors.black87,
                  myController: bloc.UpdateController,
                  maxLines: maxLines == null ? 1 : maxLines,
                  valid: (value) => null,
                ),
                ButtonUpdate(
                    controllerItemUpdating: controllerItemUpdating,
                    IdCurrentFolder: IdCurrentFolder,
                    IdCurrentItem: IdCurrentItem,
                    maxLines: maxLines,
                    labelText: labelText),
              ],
            ),
          ),
        );
  }
}
