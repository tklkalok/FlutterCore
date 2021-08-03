import 'package:flutter/material.dart';
import 'package:flutter_core/models/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';

import '../constants.dart';
import '../size_config.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key, 
    this.width, 
    this.aspectRatio, 
    required this.product,
    required this.press,
  }) : super(key: key);

  final double? width, aspectRatio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    AppLocalizations T = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width??140),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio??1.02, 
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 42
                ),
                // child: T.languageCode == 'en' 
                // ? Text(
                //   "${product.title}",
                //   style: TextStyle(
                //     color: Colors.black,
                //   ),
                //   maxLines: 2,
                // )
                // : Text(
                //   "${product.title_zh}",
                //   style: TextStyle(
                //     color: Colors.black,
                //   ),
                //   maxLines: 2,
                // ),
                child: Text(
                  T.languageCode == 'en' ? "${product.title}" : "${product.title_zh}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      width: getProportionateScreenWidth(28),
                      height: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite ? kPrimaryColor.withOpacity(0.15) : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
