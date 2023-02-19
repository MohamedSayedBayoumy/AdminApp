// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../presentation/CurrentItem_Screen/current_item.dart';
import '../ShapeItem.dart';

class GridViewItemOnline extends StatelessWidget {
  dynamic snapshot;
  dynamic id ;
  GridViewItemOnline({required this.id,required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc  = BlocProvider.of<AdminAppBloc>(context).state;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 3,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: snapshot.data.docs.length,
      itemBuilder: (ctx, index) {
        bloc.imageFromDatabase = null ;
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: CurrentItem(
                        IsOffline: true,
                        imageFromDatabase: bloc.imageFromDatabase = snapshot.data.docs[index]['image'],
                        IdCurrentFolder: id ,
                        IdCurrentItem: snapshot.data.docs[index]['IDCurrentItem'],
                        Food: snapshot.data.docs[index]['Food'],
                        Price: snapshot.data.docs[index]['Price'],
                        DescriptionEn: snapshot.data.docs[index]
                            ['DescriptionEn'],
                        DescriptionAr: snapshot.data.docs[index]
                            ['DescriptionAr']),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 25)));
          },
          child: ShapeItem(
            ImageFromFirebase: snapshot.data.docs[index]['image'],
            Food: snapshot.data.docs[index]['Food'],
          ),
        );
      },
    );
  }
}
