import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_suffix_icon.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/components/form_error.dart';
import 'package:flutter_core/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  String password = "";
  String confirmPassword = "";
  final List<String> errors = [];

  void addError({required String error}){
    if(!errors.contains(error)){
      setState((){
        errors.add(error);
      });
    }
  }

  void removeError({required String error}){
    if(errors.contains(error)){
      setState((){
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: T.signUpContinue, 
            press: (){
              if(_formKey.currentState!.validate()){
                //Go to complete profile page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }else{
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }


  TextFormField buildConfPassFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        removeError(error: T.kMatchPassError);
        if(value.isNotEmpty){
          removeError(error: T.kConfPassNullError);
        }
        confirmPassword = value;
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: T.kConfPassNullError);
          return "";
        }
        if(password != confirmPassword){
          addError(error: T.kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: T.signUpConfPasswordTitle,
        hintText: T.signUpConfPasswordPlaceholder,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildPassFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if(value.isNotEmpty){
          removeError(error: T.kPassNullError);
        }
        if(value.length >= 8){
          removeError(error: T.kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: T.kPassNullError);
          return "";
        }
        if(value.length < 8){
          addError(error: T.kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: T.signUpPasswordTitle,
        hintText: T.signUpPasswordPlaceholder,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty){
          removeError(error: T.kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)){
          removeError(error: T.kInvalidEmailError);
        }
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: T.kEmailNullError);
          return "";
        }
        if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: T.kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: T.signUpEmailTitle,
        hintText: T.signUpEmailPlaceholder,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }
}