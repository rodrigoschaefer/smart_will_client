class Will {
  int? id;
  String ownerAddress;
  String recipientAddress;
  BigInt gweiAmmount;
  DateTime? lastActivity;
  DateTime redemptionDate;
  Will(
      {this.id,
      required this.gweiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate});
}
