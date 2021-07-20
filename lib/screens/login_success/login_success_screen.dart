import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import './components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({ Key? key }) : super(key: key);
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(T.loginSuccess),
        centerTitle: true,
      ),
      body: Body()
    );
  }
}