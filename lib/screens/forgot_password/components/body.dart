import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_suffix_icon.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/components/form_error.dart';
import 'package:flutter_core/components/no_account_text.dart';
import 'package:flutter_core/size_config.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../../../constants.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                T.forgetPasswordTitle,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                T.forgetPasswordSubTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({ Key? key }) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)){
                setState((){
                  errors.remove(kEmailNullError);
                });
              }
              if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
                setState((){
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if(value!.isEmpty && !errors.contains(kEmailNullError)){
                setState((){
                  errors.add(kEmailNullError);
                });
              }
              if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
                setState((){
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: T.forgetPasswordEmailTitle,
              hintText: T.forgetPasswordEmailPlaceholder,
              suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: T.forgetPasswordContinue,
            press: (){
              if (_formKey.currentState!.validate()){
                //Call API
              }
            }
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText()
        ],
      ),
    );
  }
}