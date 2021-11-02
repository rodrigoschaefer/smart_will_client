import 'package:smart_will_client/features/will/data/models/will.dart';

abstract class WillRepository {
  Future<List<Will>> getOwnedWills(ownerAddress);
  Future<List<Will>> getRecipientWills(recipientAddress);
  Future<Will> createWill(String ownerAddress, String recipientAddress,
      int gweiAmmount, DateTime lastActivity, DateTime redemptionDate);
  Future<bool> redeemWill(recipientAddress, id);
}
