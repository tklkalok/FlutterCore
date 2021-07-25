import 'package:flutter/material.dart';

class Product {
  late final int id;
  late final String title, title_zh, description, description_zh;
  late final List<String> images;
  late final List<Color> colors;
  late final double rating, price;
  late final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.title_zh,
    required this.price,
    required this.description,
    required this.description_zh
  });
}

// Our demo Products

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    title_zh: "PS4™ 無線控制器",
    price: 64.99,
    description: description,
    description_zh: description_zh,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    title_zh: "Nike 白色運動白男士長褲",
    price: 50.5,
    description: description,
    description_zh: description_zh,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    title_zh: "Polygon XC Omega 手套",
    price: 36.55,
    description: description,
    description_zh: description_zh,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head Set",
    title_zh: "羅技頭戴耳機",
    price: 20.20,
    description: description,
    description_zh: description_zh,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
  "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
const String description_zh =
  "PS4™ 無線控制器 让你在游戏中得到你想要的东西，从过度精确控制你的游戏到共享 …";