import 'package:flutter/material.dart';
import 'package:smart_will_client/core/presentation/widgets/rounded_button.dart';
import 'package:smart_will_client/core/util/utils.dart';


import 'account_owned_wills_page.dart';
import 'account_recipient_wills_page.dart';

class AccountHomePage extends StatelessWidget {
  const AccountHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
                RoundedButton(
                  text: 'Owned Wills',
                  backgroundColor: Colors.amber,
                  onTap: () => Utils.navigateToPage(
                      context,
                      AccountOwnedWillsPage(
                        title,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  text: 'Recipient Wills',
                  backgroundColor: Colors.amber,
                  onTap: () => Utils.navigateToPage(
                      context,
                      AccountRecipientWillsPage(
                        title,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
