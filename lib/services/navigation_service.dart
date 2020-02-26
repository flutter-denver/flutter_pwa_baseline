import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    if (!isCurrentRoute(routeName)) {
      return navigatorKey.currentState.popAndPushNamed(routeName);
      // return routeName == Routes.home
      //     ? Future<bool>.value(navigatorKey.currentState.pop())
      //     : navigatorKey.currentState.popAndPushNamed(routeName);
    }
    return Future<void>.value();
  }

  bool goBack() {
    return navigatorKey.currentState.pop();
  }

  /// Get the current navigator route.
  ///
  /// This method uses information about how the Navigator method popUntil is
  /// implemented to get the current route without changing the route stack.
  /// The Navigator class doesn't expose the Navigator Route history list but
  /// the last Route entry on the history list will be sent to a client
  /// predicate function. If the predicate function returns true the last sent
  /// route is left on the stack and the popUntil method terminates. If the
  /// predicate function returns false the popUntil method pops the route off
  /// the stack and sends the next route to the predicate function.
  ///
  /// This method calls popUntil getting the current route and ALWAYS returning
  /// true so the route remains on the navigator stack as the current route.
  Route<dynamic> get currentRoute {
    Route<dynamic> currentRoute;
    navigatorKey.currentState.popUntil((Route<dynamic> route) {
      currentRoute = route;
      return true;
    });
    assert(currentRoute != null, 'Current route is null');
    assert(currentRoute.isCurrent, 'Route is not the current route');
    return currentRoute;
  }

  bool isCurrentRoute(String route) {
    return route == currentRoute.settings.name;
  }
}
