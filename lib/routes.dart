import 'package:flutter/material.dart';
import 'package:flutter_core/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_core/screens/details/details_screen.dart';
import 'package:flutter_core/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_core/screens/home/home_screen.dart';
import 'package:flutter_core/screens/login_success/login_success_screen.dart';
import 'package:flutter_core/screens/otp/otp_screen.dart';
import 'package:flutter_core/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_core/screens/sign_up/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};