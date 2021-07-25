import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key, 
    required this.text, 
    required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text, 
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18), 
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(T.homeSeeMore),
          )
        ],
      ),
    );
  }
}
