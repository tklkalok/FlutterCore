
import 'package:flutter/material.dart';
import 'package:flutter_core/components/rounded_icon_btn.dart';
import 'package:flutter_core/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // For demo using fixed value
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      child: Row(
        children: [
          // ColorDot(color: product.colors[0]),
          ...List.generate(product.colors.length, (index) => 
            ColorDot(
              color: product.colors[index],
              isSelected: selectedColor == index,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            iconData: Icons.remove,
            press: () {}
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(
            iconData: Icons.add,
            press: () {}
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.isSelected,
  }) : super(key: key);
  
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(3),
      height: getProportionateScreenWidth(35),
      width: getProportionateScreenWidth(35),
      decoration: BoxDecoration(
        //color: product.colors[0],
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected 
          ? kPrimaryColor
          : Colors.transparent,
          width: 4,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      )
    );
  }
}
