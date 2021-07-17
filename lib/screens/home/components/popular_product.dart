import 'package:flutter/material.dart';
import 'package:flutter_core/components/product_card.dart';
import 'package:flutter_core/models/Product.dart';
import 'package:flutter_core/screens/details/details_screen.dart';
import 'package:flutter_core/screens/home/components/section_title.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product", 
          press: () {}
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                demoProducts.length, 
                (index) {
                  if(demoProducts[index].isPopular)
                    return ProductCard(
                      product: demoProducts[index],
                      press: () => Navigator.pushNamed(
                        context, 
                        DetailsScreen.routeName, 
                        arguments: ProductDetailsArguments(product: demoProducts[index])
                      ),
                    );
                  return SizedBox.shrink(); //here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}
