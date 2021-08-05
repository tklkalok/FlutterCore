import 'package:flutter/material.dart';
import 'package:flutter_core/screens/home/components/popular_product.dart';
import 'package:flutter_core/screens/home/components/latest_movie.dart';
import 'package:flutter_core/screens/home/components/hot_movie.dart';
import 'package:flutter_core/screens/home/components/special_offers.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            LatestMovies(),
            SizedBox(height: getProportionateScreenWidth(30)),
            HotMovies(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}


