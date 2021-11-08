import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';
import 'package:web3dart/web3dart.dart';

class CreateWillPage extends StatelessWidget {
  String ownerAddress;
  final format = DateFormat('yyyy-MM-dd');
  late TextEditingController _recipientController;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ammountController = TextEditingController();
  WillRepository _willRepository;

  CreateWillPage(this.ownerAddress, this._willRepository) {
    _recipientController = TextEditingController(text: ownerAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Will',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _recipientController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.wallet_giftcard),
                    labelText: 'Recipient Address',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                DateTimeField(
                  format: format,
                  controller: _dateController,
                  initialValue: DateTime.now(),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Redemption Date',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.money),
                    labelText: 'Ammount (ether)',
                  ),
                  controller: _ammountController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ammountWei = EtherAmount.fromUnitAndValue(
                  EtherUnit.ether, _ammountController.text)
              .getInWei;
          bool result = await _willRepository.createWill(ownerAddress,
              _recipientController.text, ammountWei, DateTime.now());
          print('RESULT: $result');
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
