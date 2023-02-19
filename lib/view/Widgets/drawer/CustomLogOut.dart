// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Auth_bloc/Auth_bloc.dart';




class CustomLogOut extends StatelessWidget {
  const CustomLogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AuthBloc>(context);
    return   Padding(
        padding: EdgeInsets.symmetric(horizontal: media.width*.03),
        child: GestureDetector(
          onTap: (){
            bloc.add(LogOutEvent(context: context)) ;
          },
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: media.width*.250,
              height: media.height*.05,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Questrial',
                        fontSize: media.height * .022),
                  ),
                  Icon(Icons.login ,color: Colors.redAccent.shade700 , size: media.width*.04) ,
                ],
              ),
            ),
          ),
        ),
      );

  }
}
