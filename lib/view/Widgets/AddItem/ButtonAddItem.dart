// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_state.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_event.dart';
import '../../../core/Widget_Button/ButtonWidget.dart';

class ButtonAddItem extends StatelessWidget {
  dynamic IdCurrentItem;
  ButtonAddItem({required this.IdCurrentItem, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return BlocBuilder<AdminAppBloc, AdminAppState>(
        builder: (context, state) {
          if (state is LoadingAddNewItemState) {
            state.WidgetLoading = state.IsLoading;
          }
          return generalButton(
            horizontal: media.width *.4,
            height: media.height * .06,
            onPressed: () {
              bloc.add(AddNewItemEvent(
                Controller: bloc.state.clear,
                  context: context,
                  Price: bloc.state.price.text,
                  image: bloc.state.image,
                  DescriptionAr: bloc.state.DescriptionInAr.text,
                  DescriptionEn: bloc.state.DescriptionInEn.text,
                  Food: bloc.state.food.text,
                  IdCurrentItem: IdCurrentItem));
            },
            child: bloc.state.WidgetLoading == true
                ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))
                : const Text(
              'add',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,);
        });
  }
}

