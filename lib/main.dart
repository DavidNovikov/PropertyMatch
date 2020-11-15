import 'package:flutter/material.dart';
import 'package:property_match/models/info_held_by_api_model.dart';
import 'package:property_match/models/info_held_by_user_model.dart';
import 'package:property_match/screens/main_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => InfoHeldByUserModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => InfoHeldByApiModel(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: MainScreen(),
    );
  }
}
