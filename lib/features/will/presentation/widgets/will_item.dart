// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_will_client/core/presentation/widgets/rounded_button.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/util/utils.dart';

class WillItem extends StatelessWidget {
  String ownerAddress;
  String recipientAddress;
  BigInt weiAmmount;
  DateTime? lastActivity;
  DateTime redemptionDate;
  final onTapWillDelete;
  final onTapWill;
  final onTapWillRedeem;

  WillItem(
      {required this.weiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate,
      this.onTapWill,
      this.onTapWillDelete,
      this.onTapWillRedeem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Owner:',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Recipient:',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Redemption:',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Ether:',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'Last activity:',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ownerAddress,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: SizeUtils.horizontalBlockSize * 3),
                          ),
                          Text(
                            recipientAddress,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: SizeUtils.horizontalBlockSize * 3),
                          ),
                          Text(Utils.formatDateTime(context, redemptionDate)),
                          Text(Utils.weiToEther(weiAmmount)
                              .toDouble()
                              .toStringAsFixed(8)),
                          Text(Utils.formatDateTime(context, lastActivity)),
                        ],
                      ),
                    )
                  ]),
              if (onTapWillDelete != null)
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: SizeUtils.horizontalBlockSize * 8,
                    color: Colors.amber,
                  ),
                  onPressed: () => _dialog(
                      context,
                      'Are you sure you want to delete this will? This cannot be reversed!',
                      onTapWillDelete),
                ),
              if (onTapWillRedeem != null && isRedeemable())
                IconButton(
                  icon: Icon(
                    Icons.monetization_on,
                    size: SizeUtils.horizontalBlockSize * 8,
                    color: Colors.amber,
                  ),
                  onPressed: () => _dialog(
                      context,
                      'Are you sure you want to redeem this will?',
                      onTapWillRedeem),
                ),
            ],
          )),
    );
  }

  _dialog(context, message, onYes) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
            scrollable: true,
            actionsOverflowDirection: VerticalDirection.down,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            title: Text(message, style: const TextStyle(color: Colors.blue)),
            actions: [
              RoundedButton(
                text: 'Yes',
                backgroundColor: Colors.lightBlueAccent,
                onTap: onYes,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedButton(
                  text: 'Cancel',
                  backgroundColor: Colors.lightBlueAccent,
                  onTap: () {
                    Navigator.pop(context);
                  })
            ]);
      },
    );
  }

  bool isRedeemable() {
    var now = DateTime.now();
    return redemptionDate.isBefore(now) &&
        (lastActivity == null ||
            lastActivity!.isBefore(now.subtract(const Duration(days: 180))));
  }
}
