import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled87/bloc/AdminApp_Bloc/AdminApp_state.dart';

import '../../../bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import '../../../core/Widgets_TextField/TextField_Screen.dart';

class TextFieldsAddItem extends StatelessWidget {
  const TextFieldsAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminAppBloc>(context).state;
    final media = MediaQuery.of(context).size;
    return BlocBuilder<AdminAppBloc, AdminAppState>(
      builder: (context, state) {
        if(state is SuccessAddNewItemState){
          bloc.food = state.value ;
          bloc.price = state.value ;
          bloc.DescriptionInAr = state.value ;
          bloc.DescriptionInEn = state.value ;
        }
        return Column(
          children: [
            customTextForm(
              prefixIcon: Icons.fastfood_sharp,
              suffixIcon : false ,
              border: const UnderlineInputBorder(),
              labelText: 'Food',
              hintText: 'Burger King',
              theme: Colors.black87,
              myController: bloc.food,
              valid: (value) => bloc.ErrorPublic(bloc.food,
                  val: bloc.food.text, ErrorSpace: 'food Name'),
            ),
            customTextForm(
              suffixIcon : false ,
              prefixIcon:  Icons.price_change_outlined,
              border: const UnderlineInputBorder(),
              valid: (value) => bloc.ErrorPublic(bloc.food,
                  val: bloc.price.text, ErrorSpace: 'food price'),
              theme: Colors.black,
              hintText: 'EGP',
              labelText: 'Price',
              myController: bloc.price,
            ),
            SizedBox(
              height: media.height * .001,
            ),
            customTextForm(
              suffixIcon : false ,

              prefixIcon: Icons.restaurant_menu_outlined,
              maxLines: 4,
              labelText: 'Description of Food',
              hintText: 'A piece of burger and onions .. .',
              theme: Colors.black87,
              myController: bloc.DescriptionInEn,
              valid: (value) => bloc.ErrorPublic(bloc.food,
                  val: bloc.DescriptionInEn.text, ErrorSpace: 'data'),
              border: const UnderlineInputBorder(),
            ),
            SizedBox(height: media.height * .001),
            customTextForm(
              suffixIcon : false ,

              prefixIcon: Icons.restaurant_menu_outlined,
              maxLines: 4,
              labelText: 'وصف الوجبة / الطعام',
              hintText: 'قطعة برجر و بصل .. .',
              theme: Colors.black87,
              myController: bloc.DescriptionInAr,
              valid: (value) => bloc.ErrorPublic(bloc.DescriptionInAr,
                  val: bloc.DescriptionInAr.text, ErrorSpace: 'data'),
              border: const UnderlineInputBorder(),
            ),
          ],
        );
      },
    );
  }
}
