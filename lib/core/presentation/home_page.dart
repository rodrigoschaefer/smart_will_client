import 'package:flutter/material.dart';
import 'package:smart_will_client/core/presentation/widgets/account_item.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/util/utils.dart';

import 'package:smart_will_client/features/account/data/models/account.dart';
import 'package:smart_will_client/features/account/data/repositories/account_repository.dart';
import 'package:smart_will_client/features/account/presentation/account_home_page.dart';
import 'package:web3dart/web3dart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AccountRepository _accountRepository = AccountRepository();

  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _accountRepository = AccountRepository();
    accounts = _accountRepository.getAllAccounts();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.verticalBlockSize * 1),
              itemCount: accounts.length,
              itemBuilder: (BuildContext context, int index) {
                return AccountItem(
                  address: accounts[index].address,
                  onTapAddress: () {
                    Utils.navigateToPage(
                        context,
                        AccountHomePage(
                          title: accounts[index].address,
                        ));
                  },
                  onTapDelete: () {
                    Navigator.pop(context);
                    setState(() {
                      _accountRepository.deleteAccount(accounts[index].address);
                      accounts = _accountRepository.getAllAccounts();
                    });
                  },
                );
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Account acc = await _accountRepository.createRandomAccount();
          print('Account created: ' + acc.address);
          setState(() {
            accounts = _accountRepository.getAllAccounts();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
