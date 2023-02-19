// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../core/Widget_Custom_AppBar/AppBar_Widget.dart';
import '../../core/Widget_ContainerImage/ImageContaine.dart';
import '../../view/Widgets/Register/CustomButton_BlocListener_Register.dart';
import '../../view/Widgets/Register/CustomTextFields_Register.dart';
import '../../view/Widgets/Register/CustomTitle_Register.dart';
import '../../view/Widgets/Register/Custom_ResgisterImage.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const AppBarCustom(),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const TitleRegisterScreen(),
            SizedBox(height: media.height * .03),
            ContainerImage(state: false, ),
            const CustomTextFields(),
            const CustomBlocListenerButton(),
            SizedBox(
              height: media.height * .01,
            ),
          ]),
    );
  }
}
