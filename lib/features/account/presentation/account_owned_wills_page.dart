import 'package:flutter/material.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

class AccountOwnedWillsPage extends StatefulWidget {
  final address;
  WillRepository _willRepository;

  AccountOwnedWillsPage(this.address,this._willRepository);

  @override
  State<AccountOwnedWillsPage> createState() => _AccountOwnedWillsPageState();
}

class _AccountOwnedWillsPageState extends State<AccountOwnedWillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.address,
          maxLines: 2,
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          )),
    );
  }
}
