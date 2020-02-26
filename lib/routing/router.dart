import 'package:flutter/material.dart';
import 'package:the_basics/views/about/about_view.dart';
import 'package:the_basics/views/page2/page2_view.dart';
import 'package:the_basics/views/home/home_view.dart';

// Route names
class Routes {
  static const String home = '/';
  static const String about = '/about';
  static const String page2 = '/page2';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case Routes.home:
      return _getPageRoute(HomeView(), settings);
    case Routes.about:
      return _getPageRoute(AboutView(), settings);
    case Routes.page2:
      return _getPageRoute(Page2View(), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,
    settings: settings,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final RouteSettings settings;

  _FadeRoute({this.child, this.settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
