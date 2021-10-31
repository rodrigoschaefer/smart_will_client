import 'package:flutter/material.dart';
import 'package:smart_will_client/core/widgets/rounded_button.dart';

class AccountItem extends StatelessWidget {
  final String address;

  AccountItem({required this.address});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: address,
    );
  }
}
