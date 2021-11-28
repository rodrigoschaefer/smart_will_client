import 'package:web3dart/credentials.dart';

class Will {
  int? id;
  String ownerAddress;
  BigInt weiAmmount;
  DateTime redemptionDate;
  DateTime? lastActivity;
  String recipientAddress;
  bool redeemed;
  bool refunded;
  Will(
      {this.id,
      required this.weiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate,
      required this.redeemed,
      required this.refunded});

  factory Will.fromBlockchain(List<dynamic> fields) {
    return Will(
        id: (fields[0] as BigInt).toInt(),
        ownerAddress: (fields[1] as EthereumAddress).hexEip55,
        weiAmmount: fields[2],
        redemptionDate: DateTime.fromMillisecondsSinceEpoch(
            (fields[3] as BigInt).toInt() * 1000),
        lastActivity: (fields[4] as BigInt).toInt() == 0
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                (fields[4] as BigInt).toInt() * 1000),
        recipientAddress: (fields[5] as EthereumAddress).hexEip55,
        redeemed: fields[6],
        refunded: fields[7]);
  }
}
