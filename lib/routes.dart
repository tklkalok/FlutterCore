import 'package:flutter/material.dart';
import 'package:flutter_core/screens/sign_in/sign_in_screen.dart';
import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};