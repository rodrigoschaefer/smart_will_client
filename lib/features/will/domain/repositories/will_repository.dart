import 'package:smart_will_client/features/will/data/models/will.dart';

abstract class WillRepository {
  Future<List<Will>> getOwnedWills(ownerAddress);
  Future<List<Will>> getRecipientWills(recipientAddress);
  Future<String?> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate);
  Future<String?> redeemWill(recipientAddress, id);
  Future<String?> refundWill(ownerAddress, id);
  Future<String?> registerActivity(ownerAddress, id);
}
