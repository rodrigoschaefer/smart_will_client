import 'package:flutter/material.dart';
import 'package:smart_will_client/core/presentation/widgets/rounded_button.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/util/utils.dart';

import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

import 'account_owned_wills_page.dart';
import 'account_recipient_wills_page.dart';

class AccountHomePage extends StatelessWidget {
  const AccountHomePage(
      {Key? key, required this.accountAddress, required this.willRepository})
      : super(key: key);
  final WillRepository willRepository;
  final String accountAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selected account',
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.folder_open),
              const SizedBox(
                width: 10,
              ),
              Text(
                accountAddress,
              )
            ],
          ),
          width: double.infinity,
          height: SizeUtils.verticalBlockSize * 6,
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedButton(
                    text: 'Owned Wills',
                    backgroundColor: Colors.amber,
                    onTap: () => Utils.navigateToPage(
                        context,
                        AccountOwnedWillsPage(
                            address: accountAddress,
                            willRepository: willRepository)),
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
                            address: accountAddress,
                            willRepository: willRepository)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
