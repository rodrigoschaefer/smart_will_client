import 'package:smart_will_client/features/will/data/models/will.dart';

abstract class WillRepository {
  Future<List<Will>> getOwnedWills(ownerAddress);
  Future<List<Will>> getRecipientWills(recipientAddress);
  Future<bool> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate);
  Future<bool> redeemWill(recipientAddress, id);
}
