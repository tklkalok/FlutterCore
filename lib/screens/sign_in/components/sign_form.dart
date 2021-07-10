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
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        }
        if(value.length >= 8){
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: kPassNullError);
          return "";
        }
        if(value.length < 8){
          addError(error: kShortPassError);
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
        if (value.isNotEmpty){
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: kEmailNullError);
          return "";
        }
        if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
          return "";
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
