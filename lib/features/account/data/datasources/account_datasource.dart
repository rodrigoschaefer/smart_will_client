import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_will_client/core/util/Constants.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';

class AccountDatasource {
  late Box<Account> accountBox;

  AccountDatasource() {
    accountBox = Hive.box<Account>(Constants.accountBox);
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

  Account? get(String address) {
    return accountBox.get(address);
  }
}
