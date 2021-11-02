import 'package:flutter/material.dart';
import 'package:smart_will_client/core/presentation/widgets/rounded_button.dart';
import 'package:smart_will_client/core/util/size_utils.dart';

class WillItem extends StatelessWidget {
  String ownerAddress;
  String recipientAddress;
  int gweiAmmount;
  DateTime lastActivity;
  DateTime redemptionDate;
  final onTapWillDelete;
  final onTapWill;

  WillItem(
      {required this.gweiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate,
      required this.onTapWill,
      required this.onTapWillDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: InkWell(
                child: Text(ownerAddress),
                onTap: onTapWill,
              )),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  size: SizeUtils.horizontalBlockSize * 8,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
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
                              'Are you sure you want to delete this wallet? This cannot be reversed!'),
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
                },
              ),
            ],
          )),
    );
  }
}
