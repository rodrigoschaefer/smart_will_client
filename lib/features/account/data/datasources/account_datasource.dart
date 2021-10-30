import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';

class AccountDatasource {
  late Box accountBox;

  AccountDatasource() {
    init();
  }

  init() async {
    await Hive.initFlutter();
    accountBox = await Hive.openBox('accountBox');
    Hive.registerAdapter(AccountAdapter());
  }

  List<Account> getAll() {
    List<Account> accounts = [];
    accountBox.values.forEach((e) {
      accounts.add(e);
    });
    return accounts;
  }

  void store(Account acc) {
    accountBox.put(acc.address, acc);
  }

  Account get(String address) {
    return accountBox.get(address);
  }
}
