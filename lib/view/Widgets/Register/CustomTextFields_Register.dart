// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../../core/Widgets_TextField/TextField_Screen.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return Form(
      key: bloc.state.fromKeyRegister,
      child: Column(
        children: [
          customTextForm(
            suffixIcon : false ,
            maxLines: 1,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.account_circle_outlined,
            myController: bloc.state.username,
            valid: (value) {
              return bloc.state.ErrorPublic(
                  val: value!, bloc.state.username, ErrorSpace: 'username');
            },
            theme: Colors.black,
            hintText: 'username ',
            labelText: 'Name',
          ),

          customTextForm(
            suffixIcon : false ,

            maxLines: 1,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.fastfood_outlined,
            myController: bloc.state.Brand,
            valid: (value) {
              return bloc.state.ErrorPublic(
                  val: value!, bloc.state.Brand, ErrorSpace: 'username');
            },
            theme: Colors.black,
            hintText: 'Bazooka ',
            labelText: 'Brand Name',
          ),

          /// TextFormField for email

          customTextForm(
            suffixIcon : false ,

            prefixIcon: Icons.email,
            maxLines: 1,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            textInputAction: TextInputAction.next,
            myController: bloc.state.emailSingUp,
            valid: (value) {
              return bloc.state.ErrorEmail(
                  val: value!, bloc.state.emailSingUp, ErrorSpace: 'Email');
            },
            theme: Colors.black,
            hintText: 'Example@example.com ',
            labelText: 'Email',
          ),

          /// TextFormField for phone

          customTextForm(
            suffixIcon : false ,

            keyboardType: TextInputType.number ,
            maxLines: 1,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.phone_android_outlined,
            myController: bloc.state.phone,
            valid: (value) {
              return bloc.state.ErrorPublic(
                  val: value!, bloc.state.phone, ErrorSpace: 'phone');
            },
            theme: Colors.black,
            hintText: 'Your phone ',
            labelText: 'Phone    ',
          ),

          ///    TextFormField for password

          customTextForm(
            suffixIcon : false ,

            maxLines: 1,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            textInputAction: TextInputAction.done,
            myController: bloc.state.passwordSingUp,
            prefixIcon: Icons.lock_outline_rounded,
            valid: (value) {
              return bloc.state.ErrorPassword(
                  val: value!, bloc.state.passwordSingUp, ErrorSpace: 'password');
            },
            theme: Colors.black,
            hintText: 'Enter your password',
            labelText: 'Password',
          ),
        ],
      ),
    );
  }
}
