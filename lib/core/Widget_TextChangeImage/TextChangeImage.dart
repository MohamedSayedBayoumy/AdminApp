// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_state.dart';

import '../Widget_Divider/Divider.dart';

class RowText extends StatelessWidget {
  const RowText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    final media = MediaQuery.of(context).size;
    return BlocBuilder<AdminAppBloc, AdminAppState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * .01),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: media.height * .06,
            ),
            divider(
                color: bloc.state.image == null ? Colors.grey : Colors.white),
            Text(
              bloc.state.image == null
                  ? 'Tap To Select Image'
                  : 'Tap To Change Image',
              style: TextStyle(
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w500,
                  color: bloc.state.image == null ? Colors.grey : Colors.white),
            ),
            divider(
                color: bloc.state.image == null ? Colors.grey : Colors.white),
          ]),
        );
      },
    );
  }
}
