import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';
import 'package:web3dart/web3dart.dart';

class CreateWillPage extends StatefulWidget {
  String ownerAddress;
  late TextEditingController _recipientController;
  WillRepository _willRepository;

  CreateWillPage(this.ownerAddress, this._willRepository) {
    _recipientController = TextEditingController(text: ownerAddress);
  }

  @override
  State<CreateWillPage> createState() => _CreateWillPageState();
}

class _CreateWillPageState extends State<CreateWillPage> {
  final dateFormat = DateFormat('yyyy-MM-dd');

  late TextEditingController _dateController;

  final TextEditingController _ammountController =
      TextEditingController(text: '1');

  @override
  void initState() {
    _dateController =
        TextEditingController(text: dateFormat.format(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateFormat.format(DateTime.now());
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
                  controller: widget._recipientController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.wallet_giftcard),
                    labelText: 'Recipient Address',
                  ),
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                DateTimeField(
                  format: dateFormat,
                  controller: _dateController,
                  initialValue: DateTime.now(),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Redemption Date',
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (date) {
                    return date == null ? 'Specify the redemption date' : null;
                  },
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
                    style: const TextStyle(color: Colors.black),
                    validator: (text) {
                      return text == null || text.isEmpty
                          ? 'Specify the ammount'
                          : null;
                    }),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ammountWei = EtherAmount.fromUnitAndValue(
                  EtherUnit.ether, _ammountController.text)
              .getInWei;
          bool result = await widget._willRepository.createWill(
              widget.ownerAddress,
              widget._recipientController.text,
              ammountWei,
              DateTime.now());
          print('RESULT: $result');
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
