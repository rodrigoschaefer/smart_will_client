import 'package:smart_will_client/features/account/data/datasources/account_datasource.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';

class AccountRepository {
  final AccountDatasource _accountDatasource = AccountDatasource();
  final PrivateKeyDatasource _privateKeyDatasource = PrivateKeyDatasource();

  void createAccount() {}

  Account getAccountByAddress(address) {
    return _accountDatasource.get(address);
  }

  List<Account> getAllAccounts() {
    return _accountDatasource.getAll();
  }
}
