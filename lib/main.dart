import 'package:flutter/material.dart';
import 'package:flutter_core/routes.dart';
import 'package:flutter_core/screens/splash/splash_screen.dart';
import 'package:flutter_core/screens/theme.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
			title: 'Flutter Demo',
			theme: theme(), 
      initialRoute: SplashScreen.routeName,
      routes: routes,
		);
  }
}
