import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Product_provider.dart';
import 'Screens/Login_Screen.dart';

void main(){
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()..facth()),

  ],
  child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
