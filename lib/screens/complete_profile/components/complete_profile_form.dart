import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_suffix_icon.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/components/form_error.dart';
import 'package:flutter_core/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({ Key? key }) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String photoNumber;
  late String address;

  void addError({required String error}){
    if (!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}){
    if (errors.contains(error)){
      setState(() {
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
          buildFirstNameFormField(),
          SizedBox( height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox( height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox( height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox( height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'Continue', 
            press: (){
              if (_formKey.currentState!.validate()){
                // Go to OPT screen
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      )
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
          onSaved: (newValue) => address = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: kAddressNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: kAddressNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Address",
            hintText: "Enter your address",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
          ),
        );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (newValue) => photoNumber = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: kPhoneNumberNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Photo Number",
            hintText: "Enter your photo number",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
          ),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          onSaved: (newValue) => lastName = newValue!,
          decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your last name",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
          ),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
          onSaved: (newValue) => firstName = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: kNameNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: kNameNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "First Name",
            hintText: "Enter your first name",
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
          ),
        );
  }
}