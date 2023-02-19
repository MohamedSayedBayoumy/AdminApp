// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/view/Widgets/AddItem/TextFiled_AddItem.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../view/Widgets/AddItem/ButtonAddItem.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../core/Widget_ContainerImage/ImageContaine.dart';

class AddItem extends StatelessWidget {
  dynamic IdCurrentItem;
  AddItem({Key? key, required this.IdCurrentItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    bloc.imageFromDatabase = null;
    return  Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: NaturalAppBar(
            NeedLeading: false,
            Title: 'Add New Brand',
          ),
          body: Form(
            key: bloc.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ContainerImage(state: false),
                SizedBox(height: media.height * .02),
                const TextFieldsAddItem(),
                ButtonAddItem(IdCurrentItem: IdCurrentItem),
              ],
            ),
          ),
        );

  }
}
