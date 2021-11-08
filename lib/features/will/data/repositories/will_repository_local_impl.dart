import 'package:smart_will_client/features/will/data/datasources/will_local_rpc_datasource.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

class WillRepositoryLocalImpl implements WillRepository {
  final WillDatasource _willDatasource;

  WillRepositoryLocalImpl(this._willDatasource);

  @override
  Future<bool> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate) async {
    var result = await _willDatasource.createWill(
        ownerAddress, recipientAddress, weiAmmount, redemptionDate);
    return result;
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
  Future<bool> redeemWill(recipientAddress, id) {
    return _willDatasource.redeemWill(recipientAddress, id);
  }
}
