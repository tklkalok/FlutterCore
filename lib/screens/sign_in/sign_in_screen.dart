import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);
  static String routeName ="sign_in";

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(T.signInAppBarTitle),
      ),
      body: Body(),
    );
  }
}