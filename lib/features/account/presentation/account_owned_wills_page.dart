import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/util/utils.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';
import 'package:smart_will_client/features/will/presentation/create_will_page.dart';
import 'package:smart_will_client/features/will/presentation/widgets/will_item.dart';

class AccountOwnedWillsPage extends StatefulWidget {
  final String address;
  final WillRepository willRepository;

  // ignore: use_key_in_widget_constructors
  const AccountOwnedWillsPage({required this.address, required this.willRepository});

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
    } catch (e) {
      willsList = null;
    }
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
                                    Loader.show(context,
                                        isSafeAreaOverlay: false,
                                        isAppbarOverlay: true,
                                        isBottomBarOverlay: false,
                                        progressIndicator:
                                            const CircularProgressIndicator());
                                    var result = await widget.willRepository
                                        .refundWill(
                                            willsList![index].ownerAddress,
                                            willsList![index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                result ?? 'Will refunded!')));
                                    if (result == null) _fetchWills();
                                    Loader.hide();
                                  },
                                  onTapRegisterActivity: () async {
                                    Loader.show(context,
                                        isSafeAreaOverlay: false,
                                        isAppbarOverlay: true,
                                        isBottomBarOverlay: false,
                                        progressIndicator:
                                            const CircularProgressIndicator());
                                    var result = await widget.willRepository
                                        .registerActivity(
                                            willsList![index].ownerAddress,
                                            willsList![index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(result ??
                                                'Activity registered!')));
                                    if (result == null) _fetchWills();
                                    Loader.hide();
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
}
