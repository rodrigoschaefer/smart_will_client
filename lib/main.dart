import 'package:flutter/material.dart';

import 'core/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
    );
    return MaterialApp(
      title: 'Smart Will',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.blue,
            primary: Colors.amber,
            background: Colors.green),
      ),
      home: const HomePage(title: 'Smart Will'),
    );
  }
}
