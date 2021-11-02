import 'package:smart_will_client/features/will/data/datasources/will_local_rpc_datasource.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:smart_will_client/features/will/domain/repositories/will_repository.dart';

class WillRepositoryLocalImpl implements WillRepository {
  
  final WillDatasource _willDatasource;

  WillRepositoryLocalImpl(this._willDatasource);

  @override
  Future<Will> createWill(String ownerAddress, String recipientAddress,
      int gweiAmmount, DateTime lastActivity, DateTime redemptionDate) {
    // TODO: implement createWill
    throw UnimplementedError();
  }

  @override
  Future<List<Will>> getOwnedWills(ownerAddress) {
    // TODO: implement getOwnedWills
    throw UnimplementedError();
  }

  @override
  Future<List<Will>> getRecipientWills(recipientAddress) {
    // TODO: implement getRecipientWills
    throw UnimplementedError();
  }

  @override
  Future<bool> redeemWill(recipientAddress, id) {
    // TODO: implement redeemWill
    throw UnimplementedError();
  }
}
