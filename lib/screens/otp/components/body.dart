import 'package:flutter/material.dart';
import 'package:flutter_core/constants.dart';
import 'package:flutter_core/size_config.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                T.otpTitle,
                style: headingStyle
              ),
              Text(T.otpSubTitle),
              buildTimer(context),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  //resend otp here
                },
                child: Text(
                  T.otpResend,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer(context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0), 
          duration: Duration(seconds: 30), 
          builder: (context, value, child) {
            return Row(
              children: [
                Text(T.otpExpire),
                Text(
                  '00:${double.parse((value.toString())).toInt()}',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            );
          },
          onEnd: () {},
        ),
      ],
    );
  }
}
