class Will {
  String ownerAddress;
  String recipientAddress;
  int gweiAmmount;
  DateTime lastActivity;
  DateTime redemptionDate;
  Will(
      {required this.gweiAmmount,
      required this.lastActivity,
      required this.ownerAddress,
      required this.recipientAddress,
      required this.redemptionDate});
}
