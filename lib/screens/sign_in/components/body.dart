import 'package:flutter/material.dart';
import 'package:flutter_core/components/no_account_text.dart';
import 'package:flutter_core/components/social_card.dart';
import 'package:flutter_core/screens/sign_in/components/sign_form.dart';
import 'package:flutter_core/size_config.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  T.signInBodyTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  T.signInBodySubTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                      }
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                      }
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {
                      }
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),  
    );
  }
}
