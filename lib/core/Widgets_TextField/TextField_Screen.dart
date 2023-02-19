// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../bloc/Auth_bloc/Auth_bloc.dart';
import '../../presentation/UpdataItem_Screen/UpdataData.dart';
import 'Suffix_Icon.dart';

class customTextForm extends StatelessWidget {
  dynamic hintText;
  dynamic width;
  dynamic height;
  dynamic LimitLength;
  dynamic maxLines;
  dynamic labelText;
  dynamic   suffixIcon;
  dynamic textInputAction;
  dynamic icon;
  dynamic UpdateTextField;
  dynamic itemUpdating;
  dynamic IdCurrentFolder;
  dynamic IdCurrentItem;
  dynamic prefixIcon;

  TextInputType? keyboardType;
  final void Function()? onTapIcon;
  final String? Function(String?) valid;
  TextEditingController? controllerItemUpdating;
  TextEditingController? myController;
  Color theme;
  InputBorder border;

  customTextForm(
      {Key? key,
      required this.border,
      this.width,
      this.suffixIcon,
      this.keyboardType,
      this.UpdateTextField,
      this.itemUpdating,
      this.controllerItemUpdating,
      this.height,
      this.LimitLength,
      this.maxLines,

      this.prefixIcon,
      this.textInputAction,
      this.onTapIcon,
      this.icon,
      this.hintText,
      this.IdCurrentFolder,
      this.IdCurrentItem,
      required this.valid,
      required this.theme,
      required this.labelText,
      required this.myController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: theme)),
        child: TextFormField(
          keyboardType: keyboardType,
          maxLength: LimitLength,
          maxLines: maxLines,
          validator: valid,
          textInputAction: textInputAction,
          controller: myController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            label: Container(
                margin: const EdgeInsets.only(left: 2, right: 0),
                child: Text(labelText)),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon == true ?
            CustomUpDataIcon(
              IdCurrentItem: IdCurrentItem,
              labelText: labelText,
              IdCurrentFolder: IdCurrentFolder,
              controllerItemUpdating: controllerItemUpdating!,
              maxLines: maxLines,
              IconPrefix: prefixIcon ,
            ) : null ,
            border: border,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final void Function()? onTapIcon;
  const CustomIconButton({required this.onTapIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoadingShowPasswordState) {
      } else if (state is ShowPasswordState) {
        bloc.state.iconData = state.icon;
      } else if (state is DisAppearPasswordState) {}
      return IconButton(
          onPressed: () {
            bloc.add(ShowPasswordEvent(
              iconData: bloc.state.iconData,
            ));
          },
          icon: Icon(bloc.state.iconData));
    });
  }
}
