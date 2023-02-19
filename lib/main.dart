// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled87/core/Widget_Condition_Auth/Condition_Auth_Screen.dart';
import 'package:untitled87/presentation/Splash_Screen/splash_Screen.dart';
import 'package:untitled87/sss.dart';

import 'bloc/AdminApp_Bloc/AdminApp_bloc.dart';
import 'bloc/Auth_bloc/Auth_bloc.dart';
import 'bloc/BottomSheet_bloc/BottomSheet_bloc.dart';
import 'bloc/SelectChoose_bloc/select_choose_bloc.dart';

late SharedPreferences prefs;
late Database FolderData;
late Database ItemData;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
  FolderData = await openDatabase('FolderData.file', version: 1,
      onCreate: (file, version) {
    return file.execute(
        'CREATE TABLE folder (id INTEGER PRIMARY KEY , IdItems INTEGER , image VARCHAR(100) , food VARCHAR(50));');
  });

  ItemData = await openDatabase('ItemData.file', version: 1,
      onCreate: (file, version) {
    return file.execute(
        'CREATE TABLE Item (id INTEGER PRIMARY KEY , Image VARCHAR(500) , Food VARCHAR(50) , Price VARCHAR(50) , DescriptionAr VARCHAR(500) , DescriptionEn VARCHAR(500) );');
  });
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AdminAppBloc>(
              create: (context) => AdminAppBloc() ),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          BlocProvider<BottomSheetBloc>(create: (context) => BottomSheetBloc()),
          BlocProvider<SelectChooseBloc>(
              create: (context) => SelectChooseBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
