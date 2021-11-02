import 'dart:math';

import 'package:smart_will_client/core/util/constants.dart';
import 'package:smart_will_client/features/account/data/datasources/account_datasource.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';
import 'package:web3dart/web3dart.dart';
import 'package:convert/convert.dart';

class AccountRepository {
  final AccountDatasource _accountDatasource =
      AccountDatasource(Constants.accountBox);

  Account? getAccountByAddress(address) {
    return _accountDatasource.get(address);
  }

  List<Account> getAllAccounts() {
    return _accountDatasource.getAll();
  }

  Future<Account> createRandomAccount() async {
    var rng = Random.secure();
    EthPrivateKey key = EthPrivateKey.createRandom(rng);
    var address = await key.extractAddress();
    PrivateKeyDatasource.store(address.hex, hex.encode(key.privateKey));
    Account acc = Account(address: address.hex, balanceWei: 0);
    _accountDatasource.store(acc);
    return acc;
  }

  void deleteAccount(address) {
    try {
      _accountDatasource.delete(address);
      PrivateKeyDatasource.delete(address);
    } catch (e) {
      print('Error deleting account');
    }
  }
}
