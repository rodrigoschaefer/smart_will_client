import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:smart_will_client/core/util/constants.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:web3dart/web3dart.dart';

abstract class WillDatasource {
  Future<List<Will>> getWillsByOwner(ownerAddress);
  Future<List<Will>> getWillsByRecipient(recipientAddress);
  Future<bool> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate);
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
  Future<bool> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate) async {
    try {
      var pkey = await PrivateKeyDatasource.read(ownerAddress);
      final credentials = EthPrivateKey.fromHex(pkey!);
      var result = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
            from: EthereumAddress.fromHex(ownerAddress),
            contract: contract,
            function: createWillContractFunction,
            parameters: [
              BigInt.from(redemptionDate.millisecondsSinceEpoch *
                  1000), // Ethereum treats dates as seconds since linux epoch
              EthereumAddress.fromHex(recipientAddress)
            ],
            value: EtherAmount.fromUnitAndValue(EtherUnit.wei, weiAmmount)),
      );
      return true;
    } catch (e) {
      print('error! $e');
      return false;
    }
  }

  @override
  Future<List<Will>> getWillsByOwner(ownerAddress) async {
    final data = await ethClient.call(
        contract: contract,
        function: getOwnedWillsContractFunction,
        params: [EthereumAddress.fromHex(ownerAddress)]);
    return data as List<Will>;
  }

  @override
  Future<List<Will>> getWillsByRecipient(recipientAddress) async {
    final data = await ethClient.call(
        contract: contract,
        function: getRecipientWillsContractFunction,
        params: [EthereumAddress.fromHex(recipientAddress)]);
    return data as List<Will>;
  }

  @override
  Future<bool> redeemWill(recipientAddress, id) async {
    throw UnimplementedError();
  }
}
