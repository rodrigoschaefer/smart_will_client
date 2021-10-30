import 'package:flutter/material.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';

class AccountItem extends StatelessWidget {
  final Account account;

  AccountItem(this.account);

  @override
  Widget build(BuildContext context) {
    return Text('Acc 1');
  }
}
