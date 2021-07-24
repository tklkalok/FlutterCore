import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({ Key? key }) : super(key: key);
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(T.otpTitle),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}