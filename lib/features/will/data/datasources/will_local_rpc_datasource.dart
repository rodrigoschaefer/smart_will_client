import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:smart_will_client/core/util/constants.dart';
import 'package:smart_will_client/features/account/data/datasources/private_key_datasource.dart';
import 'package:smart_will_client/features/will/data/models/will.dart';
import 'package:web3dart/web3dart.dart';

abstract class WillDatasource {
  Future<List<Will>> getWillsByOwner(ownerAddress);
  Future<List<Will>> getWillsByRecipient(recipientAddress);
  Future<void> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate);
  Future<void> redeemWill(recipientAddress, id);
  Future<void> refundWill(ownerAddress, id);
  Future<void> registerActivity(ownerAddress, id);
}

class WillLocalRpcDatasource implements WillDatasource {
  late Client httpClient;
  late Web3Client ethClient;
  late EthereumAddress contractAddress;
  late DeployedContract contract;
  late ContractFunction getOwnedWillsContractFunction,
      getRecipientWillsContractFunction,
      createWillContractFunction,
      redeemWillContractFunction,
      refundWillContractFunction,
      registerActivityContractFunction;
  String rpcUrl = 'http://10.0.2.2:7545';

  WillLocalRpcDatasource() {
    httpClient = Client();
    ethClient = Web3Client(rpcUrl, httpClient);
    contractAddress =
        EthereumAddress.fromHex(Constants.smartWillContractAddress);
    init();
  }

  init() async {
    String abi = await rootBundle.loadString('lib/abis/SmartWill.abi.json');
    contract = DeployedContract(
        ContractAbi.fromJson(abi, "SmartWill"), contractAddress);
    getOwnedWillsContractFunction = contract.function('getWillsByOwner');
    getRecipientWillsContractFunction =
        contract.function('getWillsByRecipient');
    createWillContractFunction = contract.function('createWill');
    redeemWillContractFunction = contract.function('redeemWill');
    refundWillContractFunction = contract.function('refundWill');
    registerActivityContractFunction = contract.function('registerActivity');
  }

  @override
  Future<void> createWill(String ownerAddress, String recipientAddress,
      BigInt weiAmmount, DateTime redemptionDate) async {
    String? pkey = await PrivateKeyDatasource.read(ownerAddress);
    if (pkey == null) throw Exception('pKey not found');
    final credentials = EthPrivateKey.fromHex(pkey);
    var result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          from: EthereumAddress.fromHex(ownerAddress),
          contract: contract,
          function: createWillContractFunction,
          parameters: [
            BigInt.from(redemptionDate.millisecondsSinceEpoch /
                1000), // Ethereum treats dates as seconds since linux epoch
            EthereumAddress.fromHex(recipientAddress)
          ],
          value: EtherAmount.fromUnitAndValue(EtherUnit.wei, weiAmmount)),
    );
  }

  @override
  Future<List<Will>> getWillsByOwner(ownerAddress) async {
    var data = await ethClient.call(
        contract: contract,
        function: getOwnedWillsContractFunction,
        params: [EthereumAddress.fromHex(ownerAddress)]);
    List<Will> wills = [];
    for (List<dynamic> fields in data[0]) {
      wills.add(Will.fromBlockchain(fields));
    }
    return wills;
  }

  @override
  Future<List<Will>> getWillsByRecipient(recipientAddress) async {
    var data = await ethClient.call(
        contract: contract,
        function: getRecipientWillsContractFunction,
        params: [EthereumAddress.fromHex(recipientAddress)]);
    List<Will> wills = [];
    for (List<dynamic> fields in data[0]) {
      wills.add(Will.fromBlockchain(fields));
    }
    return wills;
  }

  @override
  Future<void> refundWill(ownerAddress, id) async {
    String? pkey = await PrivateKeyDatasource.read(ownerAddress);
    if (pkey == null) throw Exception('pKey not found');
    final credentials = EthPrivateKey.fromHex(pkey);
    var result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          from: EthereumAddress.fromHex(ownerAddress),
          contract: contract,
          function: refundWillContractFunction,
          parameters: [BigInt.from(id)]),
    );
  }

  @override
  Future<void> redeemWill(recipientAddress, id) async {
    String? pkey = await PrivateKeyDatasource.read(recipientAddress);
    if (pkey == null) throw Exception('pKey not found');
    final credentials = EthPrivateKey.fromHex(pkey);
    var result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        from: EthereumAddress.fromHex(recipientAddress),
        contract: contract,
        function: redeemWillContractFunction,
        parameters: [BigInt.from(id)],
      ),
    );
  }

  @override
  Future<void> registerActivity(ownerAddress, id) async {
    String? pkey = await PrivateKeyDatasource.read(ownerAddress);
    if (pkey == null) throw Exception('pKey not found');
    final credentials = EthPrivateKey.fromHex(pkey);
    var result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          from: EthereumAddress.fromHex(ownerAddress),
          contract: contract,
          function: registerActivityContractFunction,
          parameters: [BigInt.from(id)]),
    );
  }
}
