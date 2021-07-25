import 'package:flutter/material.dart';
import 'package:flutter_core/components/default_button.dart';
import 'package:flutter_core/models/Product.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../../../size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_image.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({ 
    Key? key, 
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Column(
      children: [
        ProductImages(product: product),
        Expanded(
          child: SingleChildScrollView(
            child: TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                    pressOnSeeMore: (){},
                  ),
                  SizedBox(height: getProportionateScreenWidth(10)),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9), 
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        TopRoundedContainer(
                          color: Colors.white, 
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.15,
                              right: SizeConfig.screenWidth * 0.15,
                              top: getProportionateScreenWidth(15),
                              bottom: getProportionateScreenWidth(40),
                            ),
                            child: DefaultButton(
                              text: T.detailAddToCartBtnText,
                              press: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
