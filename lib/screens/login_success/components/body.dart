import 'package:flutter/material.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * 0.4, // 40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          T.loginSuccess,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: T.loginBackToHome, 
            press: () => Navigator.pushNamed(context, HomeScreen.routeName),
          ),
        ),
        Spacer(),
      ],
    );
  }
}