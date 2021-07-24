import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          T.signUpAppBarTitle,
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}