import 'package:flutter/material.dart';
import 'package:flutter_core/components/social_card.dart';
import 'package:flutter_core/constants.dart';
import 'package:flutter_core/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter_core/size_config.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                T.signUpBodyTitle,
                style: headingStyle,
              ),
              Text(
                T.signUpBodySubTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
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
              Text(
                T.signUpBodyFooter,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
