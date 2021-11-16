import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_will_client/core/util/Constants.dart';
import 'package:smart_will_client/features/will/data/repositories/will_repository_local_impl.dart';

import 'core/presentation/home_page.dart';

import 'features/account/data/models/account.dart';
import 'features/will/data/datasources/will_local_rpc_datasource.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initApp();
  runApp(const SWApp());
}

initApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox<Account>(Constants.accountBox);
  initializeDateFormatting();
}

class SWApp extends StatelessWidget {
  const SWApp({Key? key}) : super(key: key);

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
            secondary: Colors.white,
            primary: Colors.blue,
            background: Colors.green),
        cardTheme: const CardTheme(color: Colors.lightBlue, elevation: 5),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(
        willRepository: WillRepositoryLocalImpl(WillLocalRpcDatasource()),
      ),
    );
  }
}
