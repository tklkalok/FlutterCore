import 'package:flutter/material.dart';

import '../size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key, 
    required this.iconData, 
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: TextButton(
        onPressed: press,
        child: Icon(iconData),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
        ),
      )
    );
  }
}