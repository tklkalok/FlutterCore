
import 'package:flutter/material.dart';
import 'package:flutter_core/components/rounded_icon_btn.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  late final double rating;

  CustomAppBar(this.rating);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios_new, 
              press: ()=>Navigator.pop(context)
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset('assets/icons/Star Icon.svg'),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}