import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({ Key? key }) : super(key: key);
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(T.forgetPasswordTitle),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}