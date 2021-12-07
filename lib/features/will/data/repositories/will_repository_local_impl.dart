import 'package:smart_will_client/features/will/data/datasources/will_local_rpc_datasource.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

class WillRepositoryLocalImpl implements WillRepository {
  final WillDatasource _willDatasource;

  WillRepositoryLocalImpl(this._willDatasource);

  @override
  Future<String?> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate) async {
    try {
      var result = await _willDatasource.createWill(
          ownerAddress, recipientAddress, weiAmmount, redemptionDate);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<List<Will>> getOwnedWills(ownerAddress) {
    return _willDatasource.getWillsByOwner(ownerAddress);
  }

  @override
  Future<List<Will>> getRecipientWills(recipientAddress) {
    return _willDatasource.getWillsByRecipient(recipientAddress);
  }

  @override
  Future<String?> redeemWill(recipientAddress, id) async {
    try {
      await _willDatasource.redeemWill(recipientAddress, id);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String?> refundWill(ownerAddress, id) async {
    try {
      await _willDatasource.refundWill(ownerAddress, id);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String?> registerActivity(ownerAddress, id) async {
    try {
      await _willDatasource.registerActivity(ownerAddress, id);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
