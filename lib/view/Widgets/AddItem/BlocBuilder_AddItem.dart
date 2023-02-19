// // ignore_for_file: non_constant_identifier_names, must_be_immutable
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
// import '../../../bloc/AdminApp_Bloc/AdminApp_state.dart';
// import '../../../core/Widget_ContainerImage/ImageContaine.dart';
// import 'ButtonAddItem.dart';
// import 'TextFiled_AddItem.dart';
//
// class BlocBuilderAddItem extends StatelessWidget {
//   dynamic IdCurrentItem;
//   BlocBuilderAddItem({required this.IdCurrentItem, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.of(context).size;
//     final bloc = BlocProvider.of<AdminAppBloc>(context).state;
//
//     return Form(
//         key: bloc.formKey,
//         child:
//             BlocBuilder<AdminAppBloc, AdminAppState>(builder: (context, state) {
//           if (state is LoadingAddNewItemState) {
//             state.WidgetLoading = state.IsLoading;
//           }
//           return ListView(
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             children: [
//               ContainerImage(),
//               SizedBox(height: media.height * .02),
//               const TextFieldsAddItem(),
//               ButtonAddItem(IdCurrentItem: IdCurrentItem),
//             ],
//           );
//         }));
//   }
// }
