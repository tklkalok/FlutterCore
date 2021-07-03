import 'package:flutter/material.dart';
import './components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({ Key? key }) : super(key: key);
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(' Login Success'),
        centerTitle: true,
      ),
      body: Body()
    );
  }
}