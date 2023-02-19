// ignore_for_file: must_be_immutable, file_names, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/SelectChoose_bloc/select-choose_state.dart';
import '../../../../bloc/SelectChoose_bloc/select_choose_bloc.dart';


class ContainerTitle extends StatelessWidget {
  dynamic title ;
  dynamic isDemo ;
  ContainerTitle({ required this.title, required this.isDemo,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<SelectChooseBloc>(context);
    return BlocBuilder<SelectChooseBloc, SelectChooseState>(
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.only(
                  right: media.width * .1, left: media.width * .03),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: media.width * .02,
                    vertical: media.height * .01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.7)),
                child: Text(
                  isDemo == true ? bloc.state.SelectChoose == null ? 'Pizza' : bloc.state.SelectChoose : title ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: media.width * .04,
                      fontFamily: 'Raleway'),
                ),
              ));
        }
    ) ;

  }
}