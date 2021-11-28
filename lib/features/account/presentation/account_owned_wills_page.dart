import 'package:flutter/material.dart';
import 'package:smart_will_client/core/util/constants.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/util/utils.dart';
import 'package:smart_will_client/features/account/data/datasources/account_datasource.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/account/data/models/account.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';
import 'package:smart_will_client/features/will/presentation/create_will_page.dart';
import 'package:smart_will_client/features/will/presentation/widgets/will_item.dart';

class AccountOwnedWillsPage extends StatefulWidget {
  final address;
  final WillRepository willRepository;

  const AccountOwnedWillsPage({this.address, required this.willRepository});

  @override
  State<AccountOwnedWillsPage> createState() => _AccountOwnedWillsPageState();
}

class _AccountOwnedWillsPageState extends State<AccountOwnedWillsPage> {
  List<Will>? willsList = [];
  late bool isFetchingWills;

  @override
  void initState() {
    super.initState();
    _fetchWills();
  }

  _fetchWills() async {
    setState(() {
      isFetchingWills = true;
    });
    try {
      willsList = await widget.willRepository.getOwnedWills(widget.address);
      //_injectTestAccount();
    } catch (e) {
      willsList = null;
    }
    print('FOUND ${willsList?.length} WILLS!');
    setState(() {
      isFetchingWills = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Owned wills',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
              child: isFetchingWills
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  : willsList != null
                      ? willsList!.isEmpty
                          ? const Text('No wills found')
                          : ListView.builder(
                              shrinkWrap: false,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeUtils.verticalBlockSize * 1),
                              itemCount: willsList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return WillItem(
                                  weiAmmount: willsList![index].weiAmmount,
                                  lastActivity: willsList![index].lastActivity,
                                  ownerAddress: willsList![index].ownerAddress,
                                  recipientAddress:
                                      willsList![index].recipientAddress,
                                  redemptionDate:
                                      willsList![index].redemptionDate,
                                  redeemed: willsList![index].redeemed,
                                  refunded: willsList![index].refunded,
                                  onTapWillRefund: () async {
                                    var result = await widget.willRepository
                                        .refundWill(
                                            willsList![index].ownerAddress,
                                            willsList![index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                result ?? 'Will refunded!')));
                                    if (result == null) _fetchWills();
                                  },
                                  onTapRegisterActivity: () async {
                                    widget.willRepository.registerActivity(
                                        willsList![index].ownerAddress,
                                        willsList![index].id);
                                  },
                                );
                              })
                      : const Text(
                          'Error loading owned wills',
                          style: TextStyle(color: Colors.red),
                        ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? result = await Utils.navigateToPage(
              context, CreateWillPage(widget.address, widget.willRepository));
          if (result != null && result == true) {
            setState(() {
              isFetchingWills = true;
            });
          }
          willsList = await widget.willRepository.getOwnedWills(widget.address);
          setState(() {
            isFetchingWills = false;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _injectTestAccount() {
    AccountDatasource(Constants.accountBox).store(Account(
        address: '0xfa67329C59457b31a58d797d3970d11c96Eb6702',
        balanceWei: 100));
    PrivateKeyDatasource.store('0xfa67329C59457b31a58d797d3970d11c96Eb6702',
        'bc632360b0afcd103367b1911d9a7195c49aeea21002b9840f6724ff0b2f7455');
  }
}
