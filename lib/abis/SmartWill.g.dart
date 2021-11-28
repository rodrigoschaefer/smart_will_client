// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"uint256","name":"balance","type":"uint256"}],"name":"BalanceChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"blockTime","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"redemptionTime","type":"uint256"}],"name":"RedemptionError","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"blockTime","type":"uint256"}],"name":"WillActivityRegistered","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"}],"name":"WillCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"recipient","type":"address"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"blockTime","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"redemptionTime","type":"uint256"}],"name":"WillRedeemed","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"}],"name":"WillRefunded","type":"event"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"willsByOwner","outputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"ammount","type":"uint256"},{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"uint256","name":"lastActivity","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"willsByRecipient","outputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"ammount","type":"uint256"},{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"uint256","name":"lastActivity","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"name":"createWill","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"getMaxWillCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"getWill","outputs":[{"components":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"ammount","type":"uint256"},{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"uint256","name":"lastActivity","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"internalType":"struct SmartWill.Will","name":"w","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"refundWill","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"ownerAddress","type":"address"}],"name":"getWillsByOwner","outputs":[{"components":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"ammount","type":"uint256"},{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"uint256","name":"lastActivity","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"internalType":"struct SmartWill.Will[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"recipientAddress","type":"address"}],"name":"getWillsByRecipient","outputs":[{"components":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"ammount","type":"uint256"},{"internalType":"uint256","name":"redemptionDate","type":"uint256"},{"internalType":"uint256","name":"lastActivity","type":"uint256"},{"internalType":"address payable","name":"recipient","type":"address"}],"internalType":"struct SmartWill.Will[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"redeemWill","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"registerActivy","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'SmartWill');

class SmartWill extends _i1.GeneratedContract {
  SmartWill(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<WillsByOwner> willsByOwner(_i1.EthereumAddress $param0, BigInt $param1,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '46242d63'));
    final params = [$param0, $param1];
    final response = await read(function, params, atBlock);
    return WillsByOwner(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<WillsByRecipient> willsByRecipient(
      _i1.EthereumAddress $param2, BigInt $param3,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '27e26594'));
    final params = [$param2, $param3];
    final response = await read(function, params, atBlock);
    return WillsByRecipient(response);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createWill(
      BigInt redemptionDate, _i1.EthereumAddress recipient,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'a29c5817'));
    final params = [redemptionDate, recipient];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getMaxWillCount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '9620e579'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getWill(BigInt id, {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '4192bbb0'));
    final params = [id];
    final response = await read(function, params, atBlock);
    return (response[0] as dynamic);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> refundWill(BigInt id,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '79329554'));
    final params = [id];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getWillsByOwner(_i1.EthereumAddress ownerAddress,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '7de00a9d'));
    final params = [ownerAddress];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getWillsByRecipient(
      _i1.EthereumAddress recipientAddress,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'b31ef87a'));
    final params = [recipientAddress];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> redeemWill(BigInt id,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'c93c23ee'));
    final params = [id];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> registerActivy(BigInt id,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'aaea88de'));
    final params = [id];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all BalanceChanged events emitted by this contract.
  Stream<BalanceChanged> balanceChangedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('BalanceChanged');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return BalanceChanged(decoded);
    });
  }

  /// Returns a live stream of all RedemptionError events emitted by this contract.
  Stream<RedemptionError> redemptionErrorEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('RedemptionError');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return RedemptionError(decoded);
    });
  }

  /// Returns a live stream of all WillActivityRegistered events emitted by this contract.
  Stream<WillActivityRegistered> willActivityRegisteredEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WillActivityRegistered');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WillActivityRegistered(decoded);
    });
  }

  /// Returns a live stream of all WillCreated events emitted by this contract.
  Stream<WillCreated> willCreatedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WillCreated');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WillCreated(decoded);
    });
  }

  /// Returns a live stream of all WillRedeemed events emitted by this contract.
  Stream<WillRedeemed> willRedeemedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WillRedeemed');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WillRedeemed(decoded);
    });
  }

  /// Returns a live stream of all WillRefunded events emitted by this contract.
  Stream<WillRefunded> willRefundedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WillRefunded');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WillRefunded(decoded);
    });
  }
}

class WillsByOwner {
  WillsByOwner(List<dynamic> response)
      : id = (response[0] as BigInt),
        owner = (response[1] as _i1.EthereumAddress),
        ammount = (response[2] as BigInt),
        redemptionDate = (response[3] as BigInt),
        lastActivity = (response[4] as BigInt),
        recipient = (response[5] as _i1.EthereumAddress);

  final BigInt id;

  final _i1.EthereumAddress owner;

  final BigInt ammount;

  final BigInt redemptionDate;

  final BigInt lastActivity;

  final _i1.EthereumAddress recipient;
}

class WillsByRecipient {
  WillsByRecipient(List<dynamic> response)
      : id = (response[0] as BigInt),
        owner = (response[1] as _i1.EthereumAddress),
        ammount = (response[2] as BigInt),
        redemptionDate = (response[3] as BigInt),
        lastActivity = (response[4] as BigInt),
        recipient = (response[5] as _i1.EthereumAddress);

  final BigInt id;

  final _i1.EthereumAddress owner;

  final BigInt ammount;

  final BigInt redemptionDate;

  final BigInt lastActivity;

  final _i1.EthereumAddress recipient;
}

class BalanceChanged {
  BalanceChanged(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        balance = (response[1] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt balance;
}

class RedemptionError {
  RedemptionError(List<dynamic> response)
      : blockTime = (response[0] as BigInt),
        redemptionTime = (response[1] as BigInt);

  final BigInt blockTime;

  final BigInt redemptionTime;
}

class WillActivityRegistered {
  WillActivityRegistered(List<dynamic> response)
      : id = (response[0] as BigInt),
        blockTime = (response[1] as BigInt);

  final BigInt id;

  final BigInt blockTime;
}

class WillCreated {
  WillCreated(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        id = (response[1] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt id;
}

class WillRedeemed {
  WillRedeemed(List<dynamic> response)
      : recipient = (response[0] as _i1.EthereumAddress),
        id = (response[1] as BigInt),
        blockTime = (response[2] as BigInt),
        redemptionTime = (response[3] as BigInt);

  final _i1.EthereumAddress recipient;

  final BigInt id;

  final BigInt blockTime;

  final BigInt redemptionTime;
}

class WillRefunded {
  WillRefunded(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        id = (response[1] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt id;
}
