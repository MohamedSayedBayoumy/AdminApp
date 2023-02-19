

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../bloc/AdminApp_Bloc/AdminApp_event.dart';






class RowGetImage extends StatelessWidget {
  const RowGetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AdminAppBloc>(context);
    return
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed:(){
                  bloc.add(PickImageFromCameraEvent(context: context)) ;
                },
                icon: Image.asset(
                  'assets/image/camera (3).png',
                  height: media.height * .5,
                ),
                iconSize: 50,
              ),
              SizedBox(
                width: media.width * .03,
              ),
              IconButton(
                onPressed: (){
                  bloc.add( PickImageFromGalleryEvent(context: context)) ;
                },
                icon: Image.asset(
                  'assets/image/gallery.png',
                  height: media.height * .5,
                ),
                iconSize: 50,
              ),
            ],
          ),
          // NeedLineText ?? RowText(text: 'Select file background' , isNull: true) : Container(),
        ],

    );
  }
}



