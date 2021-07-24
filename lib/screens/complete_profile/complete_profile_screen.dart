import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({ Key? key }) : super(key: key);
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          T.completeProfileTitle
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}