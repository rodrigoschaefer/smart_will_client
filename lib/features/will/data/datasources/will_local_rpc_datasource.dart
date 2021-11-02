import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:smart_will_client/core/util/constants.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:web3dart/web3dart.dart';

abstract class WillDatasource {
  Future<List<Will>> getOwnedWills(ownerAddress);
  Future<List<Will>> getRecipientWills(recipientAddress);
  Future<Will> createWill(String ownerAddress, String recipientAddress,
      int gweiAmmount, DateTime lastActivity, DateTime redemptionDate);
  Future<bool> redeemWill(recipientAddress, id);
}

class WillLocalRpcDatasource implements WillDatasource {
  late Client httpClient;
  late Web3Client ethClient;
  late EthereumAddress contractAddress;
  late DeployedContract contract;
  late ContractFunction getOwnedWillsContractFunction,
      getRecipientWillsContractFunction,
      createWillContractFunction,
      redeemWillContractFunction;
  String rpcUrl = 'http://10.0.2.2:7545';

  WillLocalRpcDatasource() {
    httpClient = Client();
    ethClient = Web3Client(rpcUrl, httpClient);
    contractAddress =
        EthereumAddress.fromHex(Constants.smartWillContractAddress);
    init();
  }

  init() async {
    String abi = await rootBundle.loadString('abis/SmartWill.json');
    contract = DeployedContract(
        ContractAbi.fromJson(abi, "SmartWill"), contractAddress);
    getOwnedWillsContractFunction = contract.function('getWillsByOwner');
    getRecipientWillsContractFunction =
        contract.function('getWillsByRecipient');
    createWillContractFunction = contract.function('createWill');
    redeemWillContractFunction = contract.function('redeemWill');
  }

  @override
  Future<Will> createWill(String ownerAddress, String recipientAddress,
      int gweiAmmount, DateTime lastActivity, DateTime redemptionDate) {
    throw UnimplementedError();
  }

  @override
  Future<List<Will>> getOwnedWills(ownerAddress) async {
    final data = await ethClient.call(
        contract: contract,
        function: getOwnedWillsContractFunction,
        params: [ownerAddress]);

    throw UnimplementedError();
  }

  @override
  Future<List<Will>> getRecipientWills(recipientAddress) {
    throw UnimplementedError();
  }

  @override
  Future<bool> redeemWill(recipientAddress, id) {
    throw UnimplementedError();
  }
}
