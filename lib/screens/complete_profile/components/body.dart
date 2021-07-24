import 'package:flutter/material.dart';
import 'package:flutter_core/constants.dart';
import 'package:flutter_core/size_config.dart';
import 'complete_profile_form.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                T.completeProfileTitle,
                style: headingStyle
              ),
              Text(
                T.completeProfileSubTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                T.completeProfileFooter,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
