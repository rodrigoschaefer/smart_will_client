import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';
import 'package:smart_will_client/features/will/presentation/widgets/will_item.dart';

class AccountRecipientWillsPage extends StatefulWidget {
  final address;
  WillRepository willRepository;

  AccountRecipientWillsPage(
      {required this.address, required this.willRepository});

  @override
  State<AccountRecipientWillsPage> createState() =>
      _AccountRecipientWillsPageState();
}

class _AccountRecipientWillsPageState extends State<AccountRecipientWillsPage> {
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
      willsList = await widget.willRepository.getRecipientWills(widget.address);
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
          'Recipient wills',
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
                                  onTapWillRedeem: () async {
                                    Loader.show(context,
                                        isSafeAreaOverlay: false,
                                        isAppbarOverlay: true,
                                        isBottomBarOverlay: false,
                                        progressIndicator:
                                            const CircularProgressIndicator());
                                    String? errorMsg =
                                        await widget.willRepository.redeemWill(
                                            willsList![index].recipientAddress,
                                            willsList![index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                errorMsg ?? 'Will redeemed!')));
                                    if (errorMsg == null) _fetchWills();
                                    Loader.hide();
                                  },
                                );
                              })
                      : const Text(
                          'Error loading recipient wills',
                          style: TextStyle(color: Colors.red),
                        ))),
    );
  }
}
