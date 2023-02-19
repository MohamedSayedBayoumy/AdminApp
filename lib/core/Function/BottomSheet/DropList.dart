


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/SelectChoose_bloc/seclect_choose_event.dart';
import 'package:untitled87/bloc/SelectChoose_bloc/select_choose_bloc.dart';

import '../../../bloc/SelectChoose_bloc/select-choose_state.dart';
import '../../../main.dart';

class DropList extends StatefulWidget {
  const DropList({Key? key}) : super(key: key);

  @override
  State<DropList> createState() => _DropList();
}

class _DropList extends State<DropList> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectChooseBloc>(context);
    return BlocBuilder<SelectChooseBloc, SelectChooseState>(
      builder: (context, state) {
        if (state is Success) {
          bloc.state.SelectChoose = state.value;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.blueAccent,
            itemHeight: 65.0,
            isExpanded: true,
            value: bloc.state.SelectChoose,
            items: prefs.getStringList('ListChoose')?.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem, child: Text(valueItem.toString()));
            }).toList(),
            onChanged: (val) {
              bloc.add(choose(value: val));
            },
          ),
        );
      },
    );
  }
}
