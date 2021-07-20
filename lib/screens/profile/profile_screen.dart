import 'package:flutter/material.dart';
import 'package:flutter_core/components/custom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);
  static String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile"
        ),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
