import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_suffix_icon.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/components/form_error.dart';
import 'package:flutter_core/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_core/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({ Key? key }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
            // height: SizeConfig.screenHeight * 0.05,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
            // height: SizeConfig.screenHeight * 0.03,
          ),
          FormError(errors: errors),
          Row(
            children: [
              Checkbox(
                value: remember, 
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState((){
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20), 
          ),
          DefaultButton(
            text: "Continue", 
            press: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                //if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      )
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue!,
          onChanged: (value) {
            if(value.isNotEmpty && errors.contains(kPassNullError)){
              setState((){
                errors.remove(kPassNullError);
              });
            }
            if(value.length >= 8 && errors.contains(kShortPassError)){
              setState((){
                errors.remove(kShortPassError);
              });
            }
            return null;
          },
          validator: (value) {
            if(value!.isEmpty && !errors.contains(kPassNullError)){
              setState((){
                errors.add(kPassNullError);
              });
              return "";
            }
            if(value.length < 8 && !errors.contains(kShortPassError)){
              setState((){
                errors.add(kShortPassError);
              });
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter you password",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
          ),
        );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
            labelText: "Email",
            hintText: "Enter you email",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
          ),
        );
  }
}
