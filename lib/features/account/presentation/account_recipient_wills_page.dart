import 'package:flutter/material.dart';

class AccountRecipientWillsPage extends StatefulWidget {
  final address;

  AccountRecipientWillsPage(this.address);

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
