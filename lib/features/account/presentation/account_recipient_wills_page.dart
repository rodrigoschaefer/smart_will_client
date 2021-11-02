import 'package:flutter/material.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

class AccountRecipientWillsPage extends StatefulWidget {
  final address;
  WillRepository _willRepository;

  AccountRecipientWillsPage(this.address,this._willRepository);

  @override
  State<AccountRecipientWillsPage> createState() =>
      _AccountRecipientWillsPageState();
}

class _AccountRecipientWillsPageState extends State<AccountRecipientWillsPage> {
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
              children: <Widget>[
               
              ],
            ),
          )),
    );
  }
}
