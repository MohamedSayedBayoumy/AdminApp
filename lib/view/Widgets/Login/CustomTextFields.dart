// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../core/Widgets_Feda_Animation/Fade_Animation_Widget.dart';
import '../../../core/Widgets_TextField/TextField_Screen.dart';
import 'CustomButton_BlocLisner.dart';

class WidgetsTextField extends StatefulWidget {
  const WidgetsTextField({Key? key}) : super(key: key);

  @override
  State<WidgetsTextField> createState() => _WidgetsTextFieldState();
}

class _WidgetsTextFieldState extends State<WidgetsTextField> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);

    return fadeDownToUp(
        child: Form(
            key: bloc.state.formKeyLogin,
            child: Column(
              children: [
                customTextForm(
                  suffixIcon : false ,

                  prefixIcon: Icons.email,
                  maxLines: 1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  myController: bloc.state.email,
                  valid: (value) {
                    return bloc.state.ErrorEmail(bloc.state.email,
                        val: value.toString(), ErrorSpace: 'Email');
                  },
                  theme: Colors.black,
                  hintText: 'Example@example.com',
                  labelText: 'Email',
                ),
                customTextForm(
                  suffixIcon : false ,
                  prefixIcon: Icons.lock_outline,
                   maxLines: 1,
                  icon: bloc.state.iconData,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  myController: bloc.state.password,
                  valid: (value) {
                    return bloc.state.ErrorPassword(bloc.state.password,
                        val: value.toString(), ErrorSpace: 'password');
                  },
                  theme: Colors.black,
                  hintText: 'Enter your password .. .',
                  labelText: 'Password',
                ),
                const BlocListenerButton(),
              ],
            )));
  }
}

class IconShowPassword extends StatelessWidget {
  const IconShowPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc ,AuthState>(
      builder: (context, state) {
      return  IconButton(
          onPressed: () {
            bloc.add(ShowPasswordEvent(iconData: bloc.state.iconData)) ;
          },
          icon: Icon(bloc.state.iconData)) ;
      },


    );
  }
}
