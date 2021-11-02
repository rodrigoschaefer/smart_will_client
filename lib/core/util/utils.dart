import 'package:flutter/material.dart';

class Utils {
  static void navigateToPage(context, Widget page,
      {bool fullscreen = false, String? routeName}) async {
    await Navigator.push(
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
