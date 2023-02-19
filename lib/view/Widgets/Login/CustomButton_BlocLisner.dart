// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../core/Widget_Button/ButtonWidget.dart';

class BlocListenerButton extends StatelessWidget {
  const BlocListenerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingStateSingIn) {
          state.WidgetLoading = state.IsLoading ;
        }else if(state is FaliureSingInWithAuthState){
          state.formKeyLogin = state.Form ;
        }
        return generalButton(
          height: media.height * .050,
          width: media.width * .40,
          horizontal: media.width * 00.30,
          onPressed: () {
            bloc.add(LoginWithAuthEvent(
              Key: bloc.state.formKeyLogin,
                email: bloc.state.email.text.trim(),
                password: bloc.state.password.text.trim(),
                context: context));
          },
          child:
          bloc.state.WidgetLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : const Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                ),
          color: Colors.black,
        );
      },
    );
  }
}
