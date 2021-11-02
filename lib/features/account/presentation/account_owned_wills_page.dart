import 'package:flutter/material.dart';

class AccountOwnedWillsPage extends StatefulWidget{

  final address;

  AccountOwnedWillsPage(this.address);

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
              children: <Widget>[
                
              ],
            ),
          )),
    );
  }
}
