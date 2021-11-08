import 'package:flutter/material.dart';

class Utils {
  static dynamic navigateToPage(context, Widget page,
      {bool fullscreen = false, String? routeName}) async {
    return await Navigator.push(
      context,
      routeName == null
          ? MaterialPageRoute(
              fullscreenDialog: fullscreen,
              builder: (BuildContext context) {
                return page;
              })
          : MaterialPageRoute(
              builder: (_) {
                return page;
              },
              settings: RouteSettings(
                name: routeName,
              ),
            ),
    );
  }
}
