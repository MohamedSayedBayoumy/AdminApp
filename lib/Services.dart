// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:untitled87/presentation/CurrentItem_Screen/current_item.dart';
// import 'package:untitled87/view/Widgets/Categories/FetchData/ErrorData/ErrorFetchData.dart';
// import 'package:untitled87/view/Widgets/Categories/FetchData/LoadUntilFetchData.dart';
// import 'package:untitled87/view/Widgets/Categories/Folder/CustomFolder.dart';
// import 'package:untitled87/view/Widgets/Current_Folder/ShapeItem.dart';
//
// import 'main.dart';
//
// class RouteServices {
//   static Route<dynamic> generateRoute(RouteSettings routeSettings) {
//     final agrs = routeSettings.arguments;
//     switch (routeSettings.name) {
//       case '':
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Page Not Found'),
//         ),
//       );
//     });
//   }
// }
//
// class Data extends StatelessWidget {
//   const Data({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         width: 400,
//         height: 900,
//         color: Colors.black45,
//         child: FutureBuilder(
//           future: FolderData.query('Items'),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               if (snapshot.data.length != 0) {
//                 return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     physics: const BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       return DemoFile(
//                         isDemo: false,
//                         FolderTitle: prefs.getString('FolderTitle'),
//                         ImageFromFirebase:
//                             snapshot.data[index]["image"].toString(),
//                         idCurrentFolder: snapshot.data[index]["id"].toString(),
//                       );
//                       // return GridView.builder(
//                       //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       //     crossAxisCount: 2,
//                       //     childAspectRatio: 3 / 3,
//                       //     crossAxisSpacing: 5,
//                       //     mainAxisSpacing: 3,
//                       //   ),
//                       //   shrinkWrap: true,
//                       //   physics: const BouncingScrollPhysics(),
//                       //   padding: EdgeInsets.zero,
//                       //   itemCount: snapshot.data.docs.length,
//                       //   itemBuilder: (ctx, index) {
//                       //     return GestureDetector(
//                       //       onTap: () {
//                       //         Navigator.push(
//                       //             context,
//                       //             PageTransition(
//                       //                 child: CurrentItem(
//                       //                 //     image: bloc.imageFromDatabase = snapshot.data.docs[index]['image'],
//                       //                 //     IdCurrentFolder: id ,
//                       //                 //     IdCurrentItem: snapshot.data.docs[index]['IDCurrentItem'],
//                       //                 //     Food: snapshot.data.docs[index]['Food'],
//                       //                 //     Price: snapshot.data.docs[index]['Price'],
//                       //                 //     DescriptionEn: snapshot.data.docs[index]
//                       //                 //     ['DescriptionEn'],
//                       //                 //     DescriptionAr: snapshot.data.docs[index]
//                       //                 //     ['DescriptionAr']
//                       //                 ),
//                       //                 type: PageTransitionType.fade,
//                       //                 duration: const Duration(milliseconds: 25)));
//                       //       },
//                       //       child:  Container(
//                       //         width: media.width * .37,
//                       //         height: media.height * .3,
//                       //         margin: EdgeInsets.only(top: media.height * .009),
//                       //         decoration: BoxDecoration(
//                       //           color: Colors.black38,
//                       //           image: DecorationImage(
//                       //               image: Image.file(snapshot.data[index]['image']) as ImageProvider,
//                       //               fit: BoxFit.cover),
//                       //           borderRadius: const BorderRadius.only(
//                       //               bottomRight: Radius.circular(10),
//                       //               bottomLeft: Radius.circular(10)),
//                       //         ),
//                       //         child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//                       //           Container(
//                       //             width: media.width * .80,
//                       //             height: media.height * .04,
//                       //             alignment: Alignment.center,
//                       //             decoration: BoxDecoration(
//                       //               color: Colors.white.withOpacity(.4),
//                       //               borderRadius: const BorderRadius.only(
//                       //                   bottomRight: Radius.circular(8),
//                       //                   bottomLeft: Radius.circular(8)),
//                       //             ),
//                       //             child: Text(snapshot.data[index]['food']  ,
//                       //                 style: const TextStyle(fontFamily: 'Questrial' , fontWeight: FontWeight.w800)),
//                       //           )
//                       //         ]),
//                       //       ) ,
//                       //     );
//                       //   },
//                       // );
//                     });
//               } else {
//                 return const ErrorFetchData();
//               }
//             } else {
//               return ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return const LoadingFetchData();
//                   });
//             }
//           },
//         ),
//       )),
//     );
//   }
// }
