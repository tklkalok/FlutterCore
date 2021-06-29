import 'package:flutter/material.dart';
import 'package:flutter_core/screens/splash/splash_screen.dart';
import 'constants.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
			title: 'Flutter Demo',
			theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
			), 
			home: SplashScreen()
		);
  }
}
