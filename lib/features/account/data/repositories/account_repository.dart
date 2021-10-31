import 'dart:math';

import 'package:smart_will_client/features/account/data/datasources/account_datasource.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';
import 'package:web3dart/web3dart.dart';

class AccountRepository {
  final AccountDatasource _accountDatasource = AccountDatasource();
  final PrivateKeyDatasource _privateKeyDatasource = PrivateKeyDatasource();

  Account? getAccountByAddress(address) {
    return _accountDatasource.get(address);
  }

  List<Account> getAllAccounts() {
    return _accountDatasource.getAll();
  }

  Future<Account> createRandomAccount() async {
    var rng = Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);
    var address = await random.extractAddress();
    Account acc = Account(address: address.hex, balanceWei: 0);
    _accountDatasource.store(acc);
    return acc;
  }
}
