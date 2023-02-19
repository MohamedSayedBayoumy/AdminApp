// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../core/Function/ShowDialog/LoadingLogin_Screen.dart';
import '../../../core/Widget_Button/ButtonWidget.dart';

class CustomBlocListenerButton extends StatelessWidget {
  const CustomBlocListenerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AuthBloc>(context);
    final blocAdminApp = BlocProvider.of<AdminAppBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingStateRegister) {
          state.WidgetLoadingLogin = state.IsLoading;
        }
        return generalButton(
          height: media.height * .050,
          width: media.width * .40,
          horizontal: media.width * 00.30,
          elevation: 15.0,
          onPressed: () {
            bloc.add(RegisterEvent(
              image: blocAdminApp.state.image ,
                context: context,
                Brand: bloc.state.Brand.text,
                email: bloc.state.emailSingUp.text,
                password: bloc.state.passwordSingUp.text,
                phone: bloc.state.phone.text,
                username: bloc.state.username.text));
          },
          child: bloc.state.WidgetLoadingLogin == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : const Text(
                  'SingUp',
                  style: TextStyle(color: Colors.white),
                ),
          color: Colors.black,
        );
      },
    );
  }
}
