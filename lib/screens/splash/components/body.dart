import 'package:flutter/material.dart';
import 'package:flutter_core/constants.dart';
import 'package:flutter_core/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_core/size_config.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    List splashData = [
      {
        "textCode": T.splashPageViewTitle1,
        "image": "assets/images/splash_1.png"
      },
      {
        "textCode": T.splashPageViewTitle2,
        "image": "assets/images/splash_2.png"
      },
      {
        "textCode": T.splashPageViewTitle3,
        "image": "assets/images/splash_3.png"
      },
    ];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState((){
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["textCode"]
                  // text: T.['splashPageViewTitle' + index.toString()]
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index)
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: T.splashContinueBtn,
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      }
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    bool isCurrentPage () {
      return currentPage == index ? true : false;
    }
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: isCurrentPage() ? 20 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage() ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3)
      )
    );
  }
}
