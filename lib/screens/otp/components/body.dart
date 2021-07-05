import 'package:flutter/material.dart';
import 'package:flutter_core/constants.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "OTP Verification",
            style: headingStyle
          ),
          Text("We sent your code to +1 898 860 ***"),
          Row(
            children: [
              Text("This code will expired in "),
              TweenAnimationBuilder(
                tween: Tween(begin: 30.0, end: 0), 
                duration: Duration(seconds: 30), 
                builder: (context, value, child) {
                  return Text('${value?.call(toInt)}');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}