// // ignore_for_file: non_constant_identifier_names, unnecessary_type_check, avoid_print
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// part 'get_image_event.dart';
// part 'get_image_state.dart';
//
// class GetImageBloc extends Bloc<GetImageEvent, GetImageState> {
//   GetImageBloc() : super(GetImageInitial()) {
//     on<PickImageFromGalleryEventr>(_PickImageFromGalleryEventr);
//     on<PickImageFromCameraEventr>(_PickImageFromCameraEventr);
//   }
//
//
//   Future<FutureOr<void>> _PickImageFromGalleryEventr(
//       PickImageFromGalleryEventr event, Emitter<GetImageState> emit) async {
//     if (event is PickImageFromGalleryEventr) {
//       emit(LoadingPickPickImageState());
//       try {
//         final MyFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//         state.file = File(MyFile!.path);
//         state.image = state.file;
//         print('ImageState : ${state.image}');
//
//          emit(SuccessPickImageFromGalleryState(state.image));
//       } catch (e) {
//         Navigator.pop(event.context) ;
//         emit(FaliurePickImageState(e.toString()));
//       }
//     }
//   }
//
//   Future<FutureOr<void>> _PickImageFromCameraEventr(
//       PickImageFromCameraEventr event, Emitter<GetImageState> emit) async {
//     if (event is PickImageFromCameraEventr) {
//       emit(LoadingPickPickImageState());
//       try {
//         final MyFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//         state.file = File(MyFile!.path);
//         state.image = state.file;
//         print('ImageState : ${state.image}');
//          emit(SuccessPickImageFromCameraState(state.image));
//       } catch (e) {
//         Navigator.pop(event.context) ;
//         emit(FaliurePickImageState(e.toString()));
//       }
//     }
//   }
// }
