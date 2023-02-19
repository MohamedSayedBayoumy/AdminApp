import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'ShapeItem.dart';


class LoadingGirdView extends StatelessWidget {
  const LoadingGirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 3,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount:1  ,
            itemBuilder: (ctx, index) {
              return ShapeItem(
                Food: 'Loading',
              );
            },
          ),
        ));
  }
}
