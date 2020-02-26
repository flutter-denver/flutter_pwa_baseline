import 'package:flutter/material.dart';
import 'package:the_basics/routing/router.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home', Routes.home),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Page 2', Routes.page2),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', Routes.about),
            ],
          )
        ],
      ),
    );
  }
}