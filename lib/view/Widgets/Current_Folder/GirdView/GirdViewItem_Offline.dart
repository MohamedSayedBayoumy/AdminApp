// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled87/view/Widgets/Current_Folder/ShapeItem.dart';

import '../../../../../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../../../../../presentation/CurrentItem_Screen/current_item.dart';
import '../../../../core/Function/SnakBar/snakbar_Screen.dart';

class GridViewItemOffline extends StatelessWidget {
  dynamic snapshot;
  dynamic id;
  GridViewItemOffline({required this.id, required this.snapshot, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    bloc.imageFromDatabase = null ;
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
      itemCount: snapshot.data.length,
      itemBuilder: (ctx, index) {
        bloc.imageFromDatabase = null;
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: CurrentItem(
                      IsOffline: false,
                        imageOfflineState: bloc.image =
                            snapshot.data[index]['Image'].toString(),
                        IdCurrentFolder: id ,
                        IdCurrentItem: snapshot.data[index]['IDCurrentItem'],
                        Food: snapshot.data[index]['Food'],
                        Price: snapshot.data[index]['Price'],
                        DescriptionEn: snapshot.data[index]['DescriptionEn'],
                        DescriptionAr: snapshot.data[index]['DescriptionAr']),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 25)));
          },
          child: ShapeItem(
            ImageFromSQl: snapshot.data[index]['Image'],
            ImageFromFirebase: null ,
            Food: snapshot.data[index]['Food'],
          ),
        );
      },
    );
  }
}
