import 'package:flutter/material.dart';
import 'package:flutter_core/models/product.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments = 
      ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      // By default our background color is white
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.product.rating),
      body: Body(product: arguments.product),
    );
  }
}

//but we also need to pass our product to our details screen
// and we use name route so we need to create a arguments class

class ProductDetailsArguments{
  final Product product;

  ProductDetailsArguments({required this.product});
}