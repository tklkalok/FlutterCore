import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_suffix_icon.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/components/form_error.dart';
import 'package:flutter_core/screens/otp/otp_screen.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

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
    AppLocalizations T = AppLocalizations.of(context)!;
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
            text: T.completeProfileContinue, 
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
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
          onSaved: (newValue) => address = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: T.kAddressNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: T.kAddressNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: T.completeProfileAddress,
            hintText: T.completeProfileAddressPlaceholder,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
          ),
        );
  }

  TextFormField buildPhoneNumberFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (newValue) => photoNumber = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: T.kPhoneNumberNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: T.kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: T.completeProfilePhone,
            hintText: T.completeProfilePhonePlaceholder,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
          ),
        );
  }

  TextFormField buildLastNameFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
          onSaved: (newValue) => lastName = newValue!,
          decoration: InputDecoration(
            labelText: T.completeProfileLastname,
            hintText: T.completeProfileLastnamePlaceholder,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
          ),
        );
  }

  TextFormField buildFirstNameFormField() {
    AppLocalizations T = AppLocalizations.of(context)!;
    return TextFormField(
          onSaved: (newValue) => firstName = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty){
              removeError(error: T.kNameNullError);
            }
          },
          validator: (value) {
            if(value!.isEmpty){
              addError(error: T.kNameNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: T.completeProfileFirstname,
            hintText: T.completeProfileFirstnamePlaceholder,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
          ),
        );
  }
}