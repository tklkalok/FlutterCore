import 'package:flutter/material.dart';
import 'package:flutter_core/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          T.signInDontHaveAccount,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          )
        ),                  
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            T.signInSignUp,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
            )
          ),
        ),
      ],
    );
  }
}
