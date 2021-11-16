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

  WillItem(
      {required this.weiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate,
      this.onTapWill,
      this.onTapWillDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Owner:',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(child: Text(ownerAddress))
            ]),
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Recipient:',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(child: Text(recipientAddress))
            ]),
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Redemption date:',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(Utils.formatDateTime(context, redemptionDate)),
              )
            ]),
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Ether:',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(
                    Utils.weiToEther(weiAmmount).toDouble().toStringAsFixed(8)),
              )
            ]),
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  'Last activity:',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(Utils.formatDateTime(context, lastActivity)),
              )
            ])
          ])),
    );
  }

  _deleteWillAction(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
            scrollable: true,
            actionsOverflowDirection: VerticalDirection.down,
            backgroundColor: Colors.amber,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            title: const Text(
                'Are you sure you want to delete this will? This cannot be reversed!'),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              RoundedButton(
                text: 'Yes',
                backgroundColor: Colors.lightBlueAccent,
                onTap: onTapWillDelete,
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
}
