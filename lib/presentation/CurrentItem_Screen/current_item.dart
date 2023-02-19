// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../core/Widget_Custom_AppBar/NaturalAppBar_Widget.dart';
import '../../core/Widgets_TextField/TextField_Screen.dart';
import '../../core/Widget_ContainerImage/ImageContaine.dart';

class CurrentItem extends StatelessWidget {
  dynamic IdCurrentItem;
  dynamic IdCurrentFolder;
  dynamic imageFromDatabase;
  dynamic imageOfflineState;
  dynamic Food;
  dynamic Price;
  dynamic DescriptionEn;
  dynamic DescriptionAr;
  dynamic IsOffline;
  CurrentItem({
    Key? key,
    this.IdCurrentItem,
    required this.IsOffline,
    this.IdCurrentFolder,
    this.imageFromDatabase,
    this.imageOfflineState,
    this.Food,
    this.Price,
    this.DescriptionEn,
    this.DescriptionAr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    final media = MediaQuery.of(context).size;
    bloc.CurrentFood.text = Food;
    bloc.CurrentPrice.text = Price;
    bloc.CurrentDescriptionInEn.text = DescriptionEn;
    bloc.CurrentDescriptionInAr.text = DescriptionAr;
    bloc.imageFromDatabase = imageFromDatabase;
    bloc.image = imageOfflineState;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: NaturalAppBar(
        NeedLeading: false,
        Title: '$Food',
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ContainerImage(state: true),
          SizedBox(
            height: media.height * .02,
          ),
          customTextForm(
            prefixIcon: Icons.fastfood_sharp,
            suffixIcon: IsOffline,
            IdCurrentItem: IdCurrentItem,
            IdCurrentFolder: IdCurrentFolder,
            controllerItemUpdating: bloc.CurrentFood,
            border: const UnderlineInputBorder(),
            labelText: 'Food',
            theme: Colors.black87,
            myController: bloc.CurrentFood,
            valid: (value) => null,
          ),
          customTextForm(
            prefixIcon:  Icons.price_change_outlined,

            suffixIcon: IsOffline,
            IdCurrentItem: IdCurrentItem,
            IdCurrentFolder: IdCurrentFolder,
            controllerItemUpdating: bloc.CurrentPrice,
            border: const UnderlineInputBorder(),
            valid: (value) => null,
            theme: Colors.black,
            labelText: 'Price',
            myController: bloc.CurrentPrice,
          ),
          SizedBox(
            height: media.height * .001,
          ),
          customTextForm(
            prefixIcon: Icons.restaurant_menu_outlined,

            suffixIcon: IsOffline,
            IdCurrentItem: IdCurrentItem,
            IdCurrentFolder: IdCurrentFolder,
            maxLines: 4,
            controllerItemUpdating: bloc.CurrentDescriptionInEn,
            labelText: 'DescriptionEn',
            theme: Colors.black87,
            myController: bloc.CurrentDescriptionInEn,
            valid: (value) => null,
            border: const UnderlineInputBorder(),
          ),
          SizedBox(height: media.height * .001),
          customTextForm(
            prefixIcon: Icons.restaurant_menu_outlined,
            suffixIcon: IsOffline,
            IdCurrentItem: IdCurrentItem,
            IdCurrentFolder: IdCurrentFolder,
            maxLines: 4,
            controllerItemUpdating: bloc.CurrentDescriptionInAr,
            labelText: 'DescriptionAr',
            theme: Colors.black87,
            myController: bloc.CurrentDescriptionInAr,
            valid: (value) => null,
            border: const UnderlineInputBorder(),
          ),
        ],
      ),
    );
  }
}
